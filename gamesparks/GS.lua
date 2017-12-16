local customjson = require("gamesparks.dmc_corona.lib.dmc_lua.json")
local crypto = require("crypto.crypto")
local WebSockets = require("gamesparks.dmc_corona.dmc_websockets")
local GSRequestBuilder = require("gamesparks.GSRequestBuilder")
local GSMessageHandler = require("gamesparks.GSMessageHandler")
local GSRequest = require("gamesparks.GSRequest")
local GSUtils = require("gamesparks.GSUtils")
local LinkedList = require("gamesparks.LinkedList")
local Utils = require("gamesparks.dmc_corona.lib.dmc_lua.lua_utils")
require 'gamesparks.runtime'

function createGS()
  local self = {
    initialised = false,
    initialising = false,
    stopped = false,
    available = false,
    authenticated = false,
    connected = false,
    networkAvailable = true,
    sessionId = nil,
    authToken = nil,
    userId = nil,
    persistantQueueUserId = nil,
    durableQueueDirty = false,
    durableQueuePaused = false,
    
    availabilityCallback = nil,
    authenticatedCallback = nil,
    messageHandlerCallback = nil,
    
    liveServers = false,
    apiSecret = "",
    apiKey = "",
    apiCredential = "",
    url = "",
    lbUrl = "",
    
    logger = nil,
    
    socket = nil,
    
    requestBuilder = nil,
    messageHandler = nil,
 
    itemsToSend = LinkedList.new(),
    persistentItemsToSend = LinkedList.new(),
    pendingRequests = {},
    
    --queueTimeout = nil,
    executeProcessQueues = false,
   
    VERSION = "1.1.0",
    
    connect,
    disconnect,
    send
  }
  
  self.requestBuilder = createGSRequestBuilder(self)
  self.messageHandler = createGSMessageHandler()
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  local setAvailabilityCallback = function(value)
    self.availabilityCallback = value
  end
    
  -- ******************************************************
  -- public function
  -- ******************************************************
  local setAuthenticatedCallback = function(value)
    self.authenticatedCallback = value
  end
    
  -- ******************************************************
  -- public function
  -- ******************************************************
  local setMessageHandlerCallback = function(value)
    self.messageHandlerCallback = value
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  local setUseLiveServices = function(value)
    self.liveServers = value
    
    buildServiceUrl()
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  local setApiSecret = function(value)
    self.apiSecret = value
    
    buildServiceUrl()
  end
    
  -- ******************************************************
  -- public function
  -- ******************************************************
  local setApiKey = function(value)
    self.apiKey = value
    
    buildServiceUrl()
  end

  -- ******************************************************
  -- public function
  -- ******************************************************
  local setApiCredential = function(value)
    self.apiCredential = value
    
    buildServiceUrl()
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  local setLogger = function(value)
    self.logger = value
  end
  
  -- ******************************************************
  internalConnected = function()
    if self.networkAvailable and self.socket ~= nil and self.socket.readyState == 1 then
      return true
    else
      return false
    end
  end
  
  -- ******************************************************
  internalSend = function(msg)
    if internalConnected() then
      self.socket:send(msg)
    end
  end
  
  -- ******************************************************
  internalKeepAlive = function()
    --[[if not internalConnected() then
      return
    end
    
    internalSend(" ")
    
    timer.performWithDelay(5000, function() internalKeepAlive() end, 1)--]]
  end
  
  -- ******************************************************
  internalOnOpen = function()
    self.connected = true
    
    log("Websocket connected")
    
    internalKeepAlive()
  end
  
  -- ******************************************************
  internalOnMessage = function(message)
    log("handleWebSocketMessage " .. message);
      
    local response, pos, msg = customjson.decode(message)
    
    if not response then
        log("Decode failed at " .. tostring(pos) .. ": " .. tostring(msg))
    else
      if response.authToken ~= nil then
        self.authToken = response.authToken
        
        saveSettings()
        
        log("Got authtoken " .. self.authToken)
      end
      
      if string.find(response["@class"], "Response") ~= nil and response.userId ~= nil then
        self.userId = response.userId
        
        initialisePersistentQueue()
        
        setAuthenticated(self.userId)
      end
      
      if response.connectUrl ~= nil then
        log("Changing connect url to " .. response.connectUrl)
        
        --if self.queueTimeout ~= nil then
        --  timer.cancel(self.queueTimeout)
        --  self.queueTimeout = nil
        --end
        
        runtime.removeEventListener("enterFrame", processQueues)
        
        self.available = false
        self.authenticated = false
        
        self.url = response.connectUrl
        
        return
      end
      
      if response.requestId ~= nil and response.requestId ~= "0" then
        local request = self.pendingRequests[response.requestId]
        
        self.pendingRequests[response.requestId] = nil
        
        if request ~= nil then
          if request.durableRetryTicks > 0 then       
            if string.find(response["@class"], "ClientError") == nil then
              if LinkedList.pop(self.persistentItemsToSend, LinkedList.search(self.persistentItemsToSend, request)) ~= nil then
                self.durableQueueDirty = true
              else
                self.durableQueueDirty = false
              end
              
              writeDurableQueueIfDirty()
            end
          end
          
          if request.callback ~= nil then
            request.callback(response)
          end
        else
          log("no pending request yet")
        end
      elseif string.find(response["@class"], "Message") ~= nil then
        if self.messageHandlerCallback ~= nil then
          self.messageHandlerCallback(response)
        end
        
        self.messageHandler.handle(response)
      elseif response["@class"] == ".AuthenticatedConnectResponse" then
        if response.error ~= nil then
          log("INCORRECT APIKEY / APISECRET")
          
          self.disconnect(true)
          
          return
        end
        
        if response.sessionId ~= nil then
          self.sessionId = response.sessionId
        end
        
        if response.nonce ~= nil then
          local toSend = {}
          
          toSend["@class"] = ".AuthenticatedConnectRequest"
          
          toSend.hmac = getHmac(response.nonce)
         
          if self.authToken ~= "0" then
            toSend.authToken = self.authToken
          end
          if self.sessionId ~= nil then
            toSend.sessionId = self.sessionId
          end
          
          local snd = customjson.encode(toSend)
          
          if snd ~= nil then
            log("sending: " .. snd)
                     
            if self.socket ~= nil then 
              self.socket:send(snd)
            end
          end
        elseif response.connectUrl == nil then
          self.initialised = true
          self.initialising = false
          
          setAvailable(true)

          --if self.queueTimeout == nil then
          --  self.queueTimeout = timer.performWithDelay(100, function() processQueues() end, 0)
          --end
          runtime.addEventListener("enterFrame", processQueues)
        end
      end
    end
  end
  
  -- ******************************************************
  internalOnClose = function()
    log("Websocket closed")
    
    --if self.connected then
      self.connected = false
      
      --if self.queueTimeout ~= nil then
      --  timer.cancel(self.queueTimeout)
      --  self.queueTimeout = nil
      --end
      
      runtime.removeEventListener("enterFrame", processQueues)
      
      if self.socket ~= nil then
        self.socket:removeEventListener(self.socket.EVENT, webSocketsEventHandler)
        self.socket = nil
        
        collectgarbage("collect")
      end
       
      log("Initialised=" .. tostring(self.initialised) .. " initialising=" .. tostring(self.initialising) .. " stopped=" .. tostring(self.stopped))
      
      setAvailable(false)
        
      if (self.initialised or self.initialising) and not self.stopped then
        log("Reconnecting...")
        
        --timer.performWithDelay(1000, function() self.connect() end, 1)
        timer.seconds(1.0, function() self.connect() end)
      end
    --end
  end
  
  -- ******************************************************
  internalOnError = function()
    if not self.connected then
      log("Websocket error. Resetting connect url to " .. self.lbUrl)
      
      --if self.queueTimeout ~= nil then
      --  timer.cancel(self.queueTimeout)
      --  self.queueTimeout = nil
      --end
      
      runtime.removeEventListener("enterFrame", processQueues)
        
      self.url = self.lbUrl
      
      if self.socket ~= nil then
        self.socket:close()
        --self.socket = nil
      end
      
      log("Reconnecting...")
      
      --timer.performWithDelay(1000, function() self.connect() end, 1)
      timer.seconds(1.0, function() self.connect() end)
    else
      log("Websocket error")
      --internalOnClose()
    end
  end
  
  -- ******************************************************
  webSocketsEventHandler = function(event)
    local evt_type = event.type
    
    if self.socket == nil then
      log("Socket event dropped")
      
      return
    end
    
    if evt_type == self.socket.ONOPEN then
      internalOnOpen()
    elseif evt_type == self.socket.ONMESSAGE then
      internalOnMessage(event.message.data)
    elseif evt_type == self.socket.ONCLOSE then
      internalOnClose()
    elseif evt_type == self.socket.ONERROR then
      Utils.print(event)
      
      internalOnError()
    end
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.connect = function()
    local p = {uri = ""}
    
    p.uri = self.url
    
    self.initialising = true
    self.stopped = false
   
    log("*** GameSparks SDK v" .. self.VERSION .. " connecting to " .. self.url)
    
    if self.networkAvailable then
      self.socket = WebSockets:new(p)
      self.socket:addEventListener(self.socket.EVENT, webSocketsEventHandler)
    else
      log("Try again...")
      
      --timer.performWithDelay(2000, function() self.connect() end, 1)
      timer.seconds(2.0, function() self.connect() end)
    end
  end
  
  -- ******************************************************
  local timeoutRequest = function(event)
    --local request = event.source.param
    local request = event
    local currItem = LinkedList.search(self.itemsToSend, request)
    local wasWaiting = false
    
    if currItem ~= nil then
      LinkedList.pop(currItem)
      
      wasWaiting = true
    end
    
    if self.pendingRequests[request:getData().requestId] == request then
      self.pendingRequests[request:getData().requestId] = nil
      
      wasWaiting = true
    end
   
    if wasWaiting and request.callback ~= nil and not request.durable then
      local timeout = {}
        
      timeout.error = {}
      timeout.error.error = "timeout"
      timeout.requestId = request:getAttribute("requestId")
      request.callback(timeout)
    end 
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.send = function(request)
    if request.durable then
      sendDurable(request)
    else
      local data = request:getData()
      
      data.requestId = getTime() .. tostring(math.random(10000))
      
      LinkedList.pushlast(self.itemsToSend, request)
      
      --local tm = timer.performWithDelay(request:getTimeoutSeconds() * 1000, timeoutRequest, 1)
      timer.seconds(request:getTimeoutSeconds(), function() timeoutRequest(request) end)
      --tm.param = request
    end
  end
  
  -- ******************************************************
  sendDurable = function(request)
    request.durable = true
      
    LinkedList.pushlast(self.persistentItemsToSend, request)
      
    self.durableQueueDirty = true
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.disconnect = function(stop)
    self.stopped = stop
    
    --if self.queueTimeout ~= nil then
    --  timer.cancel(self.queueTimeout)
    --  self.queueTimeout = nil
    --end
    
    runtime.removeEventListener("enterFrame", processQueues)
    
    if self.socket ~= nil then
      self.socket:close()
    end
    
    setAvailable(false)
    
    setAuthenticated(nil)
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  local getRequestBuilder = function()
    return self.requestBuilder
  end
    
  -- ******************************************************
  -- public function
  -- ******************************************************
  local getMessageHandler = function()
    return self.messageHandler
  end
  
  -- ******************************************************
  log = function(msg)
    if self.logger ~= nil then
      self.logger(getTime2() .. "   " .. msg)
    end
  end
  
  -- ******************************************************
  saveSettings = function()
    --[[local saveData = self.authToken
    local path = system.pathForFile("settings", system.DocumentsDirectory)
    local file, errorString = io.open(path, "w")
    
    if not file then
        log("UNABLE TO SAVE SETTINGS")
    else
        file:write(saveData)
        io.close(file)
    end
    
    file = nil--]]
    
    local path = sys.get_save_file(sys.get_config("project.title"), "settings")
    local mytable = {}
    
	table.insert(mytable, self.authToken)
    
    if not sys.save(path, mytable) then
    	log("UNABLE TO SAVE SETTINGS")
    end
  end
  
  -- ******************************************************
  setAvailable = function(availability)
    if self.available ~= availability then
      self.available = availability
        
      if self.availabilityCallback ~= nil then
        self.availabilityCallback(availability)
      end
    end
  end
  
  -- ******************************************************
  setAuthenticated = function(userId)
    if userId ~= nil then
      self.authenticated = true
    else
      self.authenticated = false
    end
    
    if self.authenticatedCallback ~= nil then
      self.authenticatedCallback(userId)
    end
  end

  -- ******************************************************
  getHmac = function(nonce)  
  	return mime.b64(crypto.hmac(crypto.sha256, nonce, self.apiSecret, true))
  end
  
  -- ******************************************************
  processQueues = function(event)
    executeProcessQueues = not executeProcessQueues
    
    if not executeProcessQueues or writeDurableQueueIfDirty() then
      return
    end
    
    if internalConnected() and self.available then
      if not self.durableQueuePaused and self.authenticated then
        local length = LinkedList.length(self.persistentItemsToSend)
        
        for i = 1, length do
          local request = LinkedList.index(self.persistentItemsToSend, i - 1)
          
          if request.durableRetryTicks == 0 or request.durableRetryTicks < tonumber(getTime()) then
            request.durableRetryTicks = tonumber(getTime()) + 10000
            
            local data = request:getData()
            
            data.requestId = "d_" .. getTime() .. tostring(math.random(10000))
            
            local output = customjson.encode(data)
            
            log(output)
        
            internalSend(output)
        
            self.pendingRequests[data.requestId] = request
          end
        end
      end
      
      if LinkedList.length(self.itemsToSend) > 0 then
        local request = LinkedList.popfirst(self.itemsToSend)
        local data = request:getData()
        local output = customjson.encode(data)
        
        log(output)
        
        internalSend(output)
        
        self.pendingRequests[data.requestId] = request
      end
    end
  end
  
  -- ******************************************************
  initialisePersistentQueue = function()
    if self.persistantQueueUserId == self.userId then
      return
    end
    
    local prevDurableQueuePaused = self.durableQueuePaused
    
    self.durableQueuePaused = true
    
    local queueArray = LinkedList.new()
    local queueString = loadPersistentQueue()
    
    if queueString ~= nil and #queueString > 0 then
      local lines = lines(queueString)
      
      for i,line in pairs(lines) do
        line = trim(line)
        if #line > 0 then
          local request = stringToRequest(line)
          
          if request ~= nil then
            LinkedList.pushlast(queueArray, request)
          end
        end
      end
    end
    
    self.persistentItemsToSend = queueArray
    
    self.persistantQueueUserId = self.userId
    
    self.durableQueuePaused = prevDurableQueuePaused
    
    log("persistantQueue COUNT: " .. LinkedList.length(self.persistentItemsToSend))
  end
  
  -- ******************************************************
  writeDurableQueueIfDirty = function()
    if self.durableQueueDirty then
      self.durableQueueDirty = false
   
      local lines = ""
      local length = LinkedList.length(self.persistentItemsToSend)
    
      for i = 1, length do
        local request = LinkedList.index(self.persistentItemsToSend, i - 1)
        local data = customjson.encode(request:getData())
        local queuedItem = {}
        
        queuedItem.rq = data
        queuedItem.sq = getHmac(data)
        
        local line = customjson.encode(queuedItem)
        
        lines = lines .. line .. "\n"
      end
      
      savePersistentQueue(lines)
      
      return true
    end
    
    return false
  end

  -- ******************************************************
  stringToRequest = function(line)
    local parsed = customjson.decode(line) 
    local data = parsed.rq
    local signature = parsed.sq
    local properSig = getHmac(data)
    
    if properSig == signature then
      return GSRequest.new(self, customjson.decode(data))
    end
    
    return nil
  end
  
  -- ******************************************************
  loadPersistentQueue = function() 
    if self.userId == nil then
      return nil
    end
    
    --[[local path = system.pathForFile(self.userId, system.DocumentsDirectory)
    local file, errorString = io.open(path, "r")
    local contents = nil

    if not file then
      log("UNABLE TO LOAD PERSISTENT QUEUE")
    else
      contents = file:read("*a")
      io.close(file)
    end
    
    file = nil--]]
    
    local path = sys.get_save_file(sys.get_config("project.title"), self.userId)
    local mytable = sys.load(path)
    local contents = nil

	if next(mytable) then
		contents = mytable[1]
	else
		log("UNABLE TO LOAD PERSISTENT QUEUE")
	end
    
    return contents
  end
  
  -- ******************************************************
  savePersistentQueue = function(queue) 
    if self.userId == nil then
      return nil
    end
    
    --[[local path = system.pathForFile(self.userId, system.DocumentsDirectory)
    local file, errorString = io.open(path, "w")
    
    if not file then
        log("UNABLE TO SAVE PERSISTENT QUEUE")
    else
        file:write(queue)
        io.close(file)
    end
    
    file = nil--]]
    
    local path = sys.get_save_file(sys.get_config("project.title"), self.userId)
    local mytable = {}
    
	table.insert(mytable, queue)
    
    if not sys.save(path, mytable) then
    	log("UNABLE TO SAVE PERSISTENT QUEUE")
    end
  end
  
  -- ******************************************************
  buildServiceUrl = function()
    local stage
    local urlAddition = self.apiKey
    local credential
    local index
    
    if self.liveServers then
      stage = "live"
    else
      stage = "preview"
    end
    
    if self.apiCredential == nil or self.apiCredential == "" then
      credential = "device"
    else
      credential = self.apiCredential
    end

    index = string.find(self.apiSecret, ":")
    if index then
      credential = "secure"
      
      urlAddition = string.sub(self.apiSecret, 1, index) .. "/" .. urlAddition
    end

    self.url = "wss://" .. stage .. "-" .. urlAddition .. ".ws.gamesparks.net/ws/" .. credential .. "/" .. urlAddition
    self.lbUrl = self.url
  end
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  isAvailable = function()
    return self.available
  end
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  getNumItemsToSend = function()
    return LinkedList.length(self.itemsToSend)
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  getNumPersistentItemsToSend = function()
    return LinkedList.length(self.persistentItemsToSend)
  end
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  setNetworkAvailable = function(available)
    self.networkAvailable = available
  end
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  isAuthenticated = function()
    return self.available and self.authToken ~= nil and self.authToken ~= "0"   
  end
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  getAuthToken = function()
    return self.authToken
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  setAuthToken = function(authToken)
    self.authToken = authToken
  end
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  clearDurableQueue = function()
    self.persistentItemsToSend = LinkedList.new()
    
    self.durableQueueDirty = true
    
    if self.userId == nil then
      return
    end
    
    --local path = system.pathForFile(self.userId, system.DocumentsDirectory)
    
    --os.remove(path)
    
    local path = sys.get_save_file(sys.get_config("project.title"), self.userId)
    local mytable = {}
    
    sys.save(path, mytable)
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  setDurableQueuePaused = function(pause)
    self.durableQueuePaused = pause
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  compareAttributeDurableRequest = function(index, attributeName, attributeValue)
    local request = LinkedList.index(self.persistentItemsToSend, index)
    
    if request ~= nil and request:getAttribute(attributeName) == attributeValue then
      return true
    else
      return false
    end
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  removeDurableRequest = function(index)
    LinkedList.popWithIndex(self.persistentItemsToSend, index)
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  setCallbackDurableRequest = function(index, callback)
    local request = LinkedList.index(self.persistentItemsToSend, index)
    
    if request ~= nil then
      request:setCallback(callback)
    end
  end

  -- ******************************************************
  return {
    GSRequestBuilder = self.requestBuilder,                           -- don't use this member
    GSMessageHandler = self.messageHandler,                           -- don't use this member
    
    setAvailabilityCallback = setAvailabilityCallback,
    setAuthenticatedCallback = setAuthenticatedCallback,
    setMessageHandlerCallback = setMessageHandlerCallback,
    setUseLiveServices = setUseLiveServices,
    setApiSecret = setApiSecret,
    setApiKey = setApiKey,
    setApiCredential = setApiCredential,
    setLogger = setLogger,
    connect = self.connect,
    send = self.send,
    disconnect = self.disconnect,
    getRequestBuilder = getRequestBuilder,
    getMessageHandler = getMessageHandler,
    
    isAvailable = isAvailable,                                        -- don't use this function
    getNumItemsToSend = getNumItemsToSend,                            -- don't use this function
    getNumPersistentItemsToSend = getNumPersistentItemsToSend,        -- don't use this function
    setNetworkAvailable = setNetworkAvailable,                        -- don't use this function
    isAuthenticated = isAuthenticated,                                -- don't use this function
    getAuthToken = getAuthToken,                                      -- don't use this function
    setAuthToken = setAuthToken,                                      -- don't use this function
    clearDurableQueue = clearDurableQueue,                            -- don't use this function
    setDurableQueuePaused = setDurableQueuePaused,                    -- don't use this function
    compareAttributeDurableRequest = compareAttributeDurableRequest,  -- don't use this function
    removeDurableRequest = removeDurableRequest,                      -- don't use this function
    setCallbackDurableRequest = setCallbackDurableRequest             -- don't use this function
  }
end
