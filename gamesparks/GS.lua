local customjson = require("gamesparks.dmc_corona.lib.dmc_lua.json")
local crypto = require("crypto.crypto")
local WebSockets = require("gamesparks.dmc_corona.dmc_websockets")
local GSRequestBuilder = require("gamesparks.GSRequestBuilder")
local GSMessageHandler = require("gamesparks.GSMessageHandler")
local GSRequest = require("gamesparks.GSRequest")
local GSUtils = require("gamesparks.GSUtils")
local LinkedList = require("gamesparks.LinkedList")
local Utils = require("gamesparks.dmc_corona.lib.dmc_lua.lua_utils")
local GSData = require("gamesparks.GSData")
require 'gamesparks.runtime'

function createGS(_name)
  local self = {
    name = _name,
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
    durableNextDrainInterval = 0,
    requestCounter = 0,
    
    availabilityCallback = nil,
    authenticatedCallback = nil,
    messageHandlerCallback = nil,
    
    liveServers = false,
    apiSecret = "",
    apiKey = "",
    apiCredential = "",
    url = "",
    lbUrl = "",
    customUrlBase = "",
    
    logger = nil,
    
    socket = nil,
    
    requestBuilder = nil,
    messageHandler = nil,
 
    itemsToSend = LinkedList.new(),
    persistentItemsToSend = LinkedList.new(),
    pendingRequests = {},
    
    executeProcessQueues = false,
   
    deviceOS = "",
    deviceID = "",
    platform = "",
    SDK = "Defold",
    VERSION = "1.2.1",

    origRetryBase = 2000,
    retryBase,
    origRetryMax = 60000,
    retryMax,
    origRequestTimeout = 15000,
    requestTimeout,
    origDurableConcurrentRequests = 1,
    durableConcurrentRequests,
    origDurableDrainInterval = 100,
    durableDrainInterval,
    origHandshakeOffset = 2000,
    handshakeOffset,

    connectionAttempts = 0,
    mustConnectBy = 0,
    handShakeTimeout = nil,

    setAvailabilityCallback,
    setAuthenticatedCallback,
    setMessageHandlerCallback,
    setUseLiveServices,
    setApiSecret,
    setApiKey,
    setApiCredential,
    setLogger,

    internalConnected,
    internalSend,
    internalKeepAlive,
    internalOnOpen,
    internalOnMessage,
    internalOnClose,
    internalOnError,
    webSocketsEventHandler,
    
    connect,
    timeoutRequest,
    send,
    sendDurable,
    disconnect,
    reset,

    getRequestBuilder,
    getMessageHandler,

    getDeviceStats,

    isAvailable,
    isAuthenticated,

    log,
    saveSettings,
    setAvailable,
    setAuthenticated,
    getHmac,
    processQueues,
    initialisePersistentQueue,
    writeDurableQueueIfDirty,
    stringToRequest,
    loadPersistentQueue,
    savePersistentQueue,

    buildServiceUrl,
    setCustomServiceUrl,

    getNumItemsToSend,
    getNumPersistentItemsToSend,
    setNetworkAvailable,
    getAuthToken,
    setAuthToken,
    clearDurableQueue,
    setDurableQueuePaused,
    compareAttributeDurableRequest,
    removeDurableRequest,
    setCallbackDurableRequest,

    computeSleepPeriod,
    getRetryBase,
    setRetryBase,           
    getRetryMax,
    setRetryMax,
    getRequestTimeout,
    setRequestTimeout,
    getDurableConcurrentRequests,
    setDurableConcurrentRequests,
    getDurableDrainInterval,
    setDurableDrainInterval,
    getHandshakeOffset,
    setHandshakeOffset
  }
  
  self.requestBuilder = createGSRequestBuilder(self)
  self.messageHandler = createGSMessageHandler()

  self.retryBase = self.origRetryBase
  self.retryMax = self.origRetryMax
  self.requestTimeout = self.origRequestTimeout
  self.durableConcurrentRequests = self.origDurableConcurrentRequests
  self.durableDrainInterval = self.origDurableDrainInterval
  self.handshakeOffset = self.origHandshakeOffset

  local platform = sys.get_sys_info().system_name

  if platform == "Android" then
	self.deviceOS = "ANDROID"
  elseif platform == "iPhone OS" then
	self.deviceOS = "IOS"
  elseif platform == "Darwin" then
	self.deviceOS = "MACOS"
  elseif platform == "Linux" then
	self.deviceOS = "LINUX"
  elseif platform == "Windows" then
	self.deviceOS = "WINDOWS"
  elseif platform == "HTML5" then
	self.deviceOS = "HTML5"
  end

  self.deviceID = sys.get_sys_info().device_ident

  self.platform = self.SDK .. " "
  if sys.get_engine_info().is_debug then
	self.platform = self.platform .. "debug"
  else
	self.platform = self.platform .. "release"
  end

-- ******************************************************
  local path = sys.get_save_file(sys.get_config("project.title"), "settings" .. tostring(self.name))
  local mytable = sys.load(path)
  local contents = nil

  if next(mytable) then
	contents = mytable[1]
  end

  if contents ~= nil then
	self.authToken = contents
  end

  -- ******************************************************
  -- public function
  -- ******************************************************
  self.setAvailabilityCallback = function(value)
    self.availabilityCallback = value
  end
    
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.setAuthenticatedCallback = function(value)
    self.authenticatedCallback = value
  end
    
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.setMessageHandlerCallback = function(value)
    self.messageHandlerCallback = value
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.setUseLiveServices = function(value)
    self.liveServers = value
    
    self.buildServiceUrl()
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.setApiSecret = function(value)
    self.apiSecret = value
    
    self.buildServiceUrl()
  end
    
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.setApiKey = function(value)
    self.apiKey = value
    
    self.buildServiceUrl()
  end

  -- ******************************************************
  -- public function
  -- ******************************************************
  self.setApiCredential = function(value)
    self.apiCredential = value
    
    self.buildServiceUrl()
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.setLogger = function(value)
    self.logger = value
  end
  
  -- ******************************************************
  self.internalConnected = function()
    if self.networkAvailable and self.socket ~= nil and self.socket.readyState == 1 then
      return true
    else
      return false
    end
  end
  
  -- ******************************************************
  self.internalSend = function(msg)
    if self.internalConnected() then
      self.socket:send(msg)
    end
  end
  
  -- ******************************************************
  self.internalKeepAlive = function()
    if self.internalConnected() then
      self.internalSend(" ")
    
      timer.seconds(30, function() self.internalKeepAlive() end)
    end
  end
  
  -- ******************************************************
  self.internalOnOpen = function()
    self.connected = true
    
    self.log("Websocket connected")
   
    self.internalKeepAlive()
  end
  
  -- ******************************************************
  self.internalOnMessage = function(message)
    self.log("handleWebSocketMessage " .. message);
      
    local response, pos, msg = customjson.decode(message)
    
    if not response then
        self.log("Decode failed at " .. tostring(pos) .. ": " .. tostring(msg))
    else
      if response.authToken ~= nil then
        self.authToken = response.authToken
        
        self.saveSettings()
        
        self.log("Got authtoken " .. self.authToken)
      end
      
      if string.find(response["@class"], "Response") ~= nil and response.userId ~= nil then
        self.userId = response.userId
        
        self.initialisePersistentQueue()
        
        self.setAuthenticated(self.userId)
      end
      
      if response.connectUrl ~= nil then
        self.log("Changing connect url to " .. response.connectUrl)
        
        runtime.removeEventListener("enterFrame", self.processQueues)
        
        self.available = false
        self.authenticated = false
        
        self.url = response.connectUrl

        self.connectionAttempts = 0
        
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
              
              self.writeDurableQueueIfDirty()
            end
          end
          
          if request.callback ~= nil then
            request.callback(response)
          end
        else
          self.log("no pending request yet")
        end
      elseif string.find(response["@class"], "Message") ~= nil then
        if self.messageHandlerCallback ~= nil then
          self.messageHandlerCallback(response)
        end
        
        self.messageHandler.handle(response)
      elseif response["@class"] == ".AuthenticatedConnectResponse" then
        if response.error ~= nil then
          self.log("INCORRECT APIKEY / APISECRET")
          
          self.disconnect(true)
          
          return
        end

        if response.clientConfig ~= nil then
          if response.clientConfig.retryBase ~= nil then
            self.setRetryBase(tonumber(response.clientConfig.retryBase))
          else
            self.retryBase = self.origRetryBase
          end

          if response.clientConfig.retryMax ~= nil then
            self.setRetryMax(tonumber(response.clientConfig.retryMax))
          else
            self.retryMax = self.origRetryMax
          end
          
          if response.clientConfig.requestTimeout ~= nil then
            self.setRequestTimeout(tonumber(response.clientConfig.requestTimeout))
          else
            self.requestTimeout = self.origRequestTimeout
          end

          if response.clientConfig.durableConcurrentRequests ~= nil  then
            self.setDurableConcurrentRequests(tonumber(response.clientConfig.durableConcurrentRequests))
          else
            self.durableConcurrentRequests = self.origDurableConcurrentRequests
          end

          if response.clientConfig.durableDrainInterval ~= nil then
            self.setDurableDrainInterval(tonumber(response.clientConfig.durableDrainInterval))
          else
            self.durableDrainInterval = self.origDurableDrainInterval
          end
             
          if response.clientConfig.handshakeOffset ~= nil then
            self.setHandshakeOffset(tonumber(response.clientConfig.handshakeOffset))
          else
            self.handshakeOffset = self.origHandshakeOffset
          end   
        else
          self.retryBase = self.origRetryBase
          self.retryMax = self.origRetryMax
          self.requestTimeout = self.origRequestTimeout
          self.durableConcurrentRequests = self.origDurableConcurrentRequests
          self.durableDrainInterval = self.origDurableDrainInterval
          self.handshakeOffset = self.origHandshakeOffset
        end
        
        if response.sessionId ~= nil then
          self.sessionId = response.sessionId
        end
        
        if response.nonce ~= nil then
          local toSend = {}
          
          toSend["@class"] = ".AuthenticatedConnectRequest"
          
          toSend.hmac = self.getHmac(response.nonce)

          toSend.os = self.deviceOS
          toSend.platform = self.platform
          toSend.deviceId = self.deviceID
         
          if self.authToken ~= "0" then
            toSend.authToken = self.authToken
          end
          if self.sessionId ~= nil then
            toSend.sessionId = self.sessionId
          end
          
          local snd = customjson.encode(toSend)
          
          if snd ~= nil then
            self.log("sending: " .. snd)
                     
            if self.socket ~= nil then 
              self.socket:send(snd)
            end
          end
        elseif response.connectUrl == nil then
          self.initialised = true
          self.initialising = false

          if self.handShakeTimeout ~= nil then
            timer.cancel(self.handShakeTimeout)
            self.handShakeTimeout = nil
          end
          
          self.setAvailable(true)

          self.connectionAttempts = 0

          runtime.addEventListener("enterFrame", self.processQueues)
        end
      end
    end
  end
  
  -- ******************************************************
  self.internalOnClose = function()
    self.log("Websocket closed")
    
    self.connected = false

    if self.handShakeTimeout ~= nil then
      timer.cancel(self.handShakeTimeout)
      self.handShakeTimeout = nil
    end
    
      runtime.removeEventListener("enterFrame", self.processQueues)
    
    if self.socket ~= nil then
      self.socket:removeEventListener(self.socket.EVENT, self.webSocketsEventHandler)
      self.socket = nil
      
      collectgarbage("collect")
    end
     
    self.log("Initialised=" .. tostring(self.initialised) .. " initialising=" .. tostring(self.initialising) .. " stopped=" .. tostring(self.stopped))
    
    self.setAvailable(false)
      
    if (self.initialised or self.initialising) and not self.stopped then
      self.log("Reconnecting...")
      
      if self.connectionAttempts == 0 or self.mustConnectBy < runtime.getTimer() then
        self.connect(true)
      else
        timer.seconds((self.mustConnectBy - runtime.getTimer()) / 1000, function() self.connect(true) end)
      end
    end
  end
  
  -- ******************************************************
  self.internalOnError = function()
    if not self.connected then
      self.log("Websocket error. Resetting connect url to " .. self.lbUrl)

      if self.handShakeTimeout ~= nil then
        timer.cancel(self.handShakeTimeout)
        self.handShakeTimeout = nil
      end
      
      runtime.removeEventListener("enterFrame", self.processQueues)
        
      self.url = self.lbUrl
      
      if self.socket ~= nil then
        self.socket:close()
        --self.socket = nil
      end
      
      self.log("Reconnecting...")
      
      if self.connectionAttempts == 0 or self.mustConnectBy < runtime.getTimer() then
        self.connect(true)
      else
        timer.seconds((self.mustConnectBy - runtime.getTimer()) / 1000, function() self.connect(true) end)
      end
    else
      self.log("Websocket error")
      --internalOnClose()
    end
  end
  
  -- ******************************************************
  self.webSocketsEventHandler = function(event)
    local evt_type = event.type
    
    if self.socket == nil then
      self.log("Socket event dropped")
      
      return
    end
    
    if evt_type == self.socket.ONOPEN then
      self.internalOnOpen()
    elseif evt_type == self.socket.ONMESSAGE then
      self.internalOnMessage(event.message.data)
    elseif evt_type == self.socket.ONCLOSE then
      self.internalOnClose()
    elseif evt_type == self.socket.ONERROR then
      Utils.print(event)
      
      self.internalOnError()
    end
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.connect = function(checkStopped)
    local p = {uri = "", timeout = self.origRetryMax + self.origHandshakeOffset + 1000}

    if self.handShakeTimeout ~= nil then
      timer.cancel(self.handShakeTimeout)
      self.handShakeTimeout = nil
    end

    if checkStopped and self.stopped then
      return
    end
    
    p.uri = self.url
    
    self.initialising = true
    self.stopped = false

    self.retryBase = self.origRetryBase
    self.retryMax = self.origRetryMax
    self.requestTimeout = self.origRequestTimeout
    self.durableConcurrentRequests = self.origDurableConcurrentRequests
    self.durableDrainInterval = self.origDurableDrainInterval
    self.handshakeOffset = self.origHandshakeOffset

    self.connectionAttempts = self.connectionAttempts + 1;
   
    self.mustConnectBy = runtime.getTimer() + self.computeSleepPeriod(self.connectionAttempts) + self.handshakeOffset

    self.log("*** GameSparks SDK v" .. self.VERSION .. " connecting to " .. self.url)
   
    self.handShakeTimeout = timer.seconds((self.mustConnectBy - runtime.getTimer()) / 1000, function() 
      self.log("Try again...")

	  self.disconnect(false)

	  self.connect(checkStopped)
    end)
    
    if self.networkAvailable then
      self.socket = WebSockets:new(p)
      self.socket:addEventListener(self.socket.EVENT, self.webSocketsEventHandler)
    end
  end
  
  -- ******************************************************
  self.timeoutRequest = function(event)
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
      self.sendDurable(request)
    else
      local data = request:getData()
      
      data.requestId = getTime() .. "_" .. self.requestCounter

      self.requestCounter = self.requestCounter + 1

      --if request:getTimeoutMilliSeconds() ~= self.requestTimeout then
      --  data.timeout = request:getTimeoutMilliSeconds()
      --end
      
      LinkedList.pushlast(self.itemsToSend, request)
      
      --local tm = timer.performWithDelay(request:getTimeoutSeconds() * 1000, timeoutRequest, 1)
      timer.seconds(request:getTimeoutMilliSeconds() / 1000, function() self.timeoutRequest(request) end)
      --tm.param = request
    end
  end
  
  -- ******************************************************
  self.sendDurable = function(request)
    request.durable = true
      
    LinkedList.pushlast(self.persistentItemsToSend, request)
      
    self.durableQueueDirty = true
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.disconnect = function(stop)
    self.stopped = stop

    if self.handShakeTimeout ~= nil then
      timer.cancel(self.handShakeTimeout)
      self.handShakeTimeout = nil
    end
    
    runtime.removeEventListener("enterFrame", self.processQueues)
    
    if self.socket ~= nil then
      self.socket:close()
    end
    
    self.setAvailable(false)
    
    self.setAuthenticated(nil)
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.reset = function()
    self.disconnect(true)

    self.sessionId = nil
    self.authToken = nil
    self.userId = nil

    self.connect()
  end
  
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.getRequestBuilder = function()
    return self.requestBuilder
  end
    
  -- ******************************************************
  -- public function
  -- ******************************************************
  self.getMessageHandler = function()
    return self.messageHandler
  end

  -- ******************************************************
  -- public function
  -- ******************************************************
  self.getDeviceStats = function()
	local data = {}
	local sysinfo = sys.get_sys_info()

	if sysinfo.system_name == "Darwin" then
		data["manufacturer"] = "Apple"
	else 
		data["manufacturer"] = sysinfo.manufacturer
	end
	data["model"] = sysinfo.device_model
	if sysinfo.system_name == "Android" then
		data["os.name"] = "Android OS"
	elseif sysinfo.system_name == "iPhone OS" then
		data["os.name"] = "iPhone"
	elseif sysinfo.system_name == "Darwin" then
		data["os.name"] = "Mac OS X"
	else
		data["os.name"] = sysinfo.system_name
	end
	if self.deviceOS == "ANDROID" then
		data["os.version"] = sysinfo.api_version
	else
		data["os.version"] = sysinfo.system_version
	end
	data["memory"] = math.ceil(collectgarbage("count") / 1024) .. " MB"
	data["cpu.cores"] = "0"
	if self.deviceOS == "IOS" or self.deviceOS == "ANDROID" then
		data["cpu.vendor"] = "ARM"
	else
		data["cpu.vendor"] = "x86_64"
	end
	data["resolution"] = sys.get_config("display.width") .. "x" .. sys.get_config("display.height")
	data["gssdk"] = self.VERSION
	data["engine"] = self.SDK
	data["engine.version"] = sys.get_engine_info().version
	
    return GSData.new(data)
  end

  -- ******************************************************
  -- public function
  -- ******************************************************

  self.isAvailable = function()
    return self.available
  end

  -- ******************************************************
  -- public function
  -- ******************************************************
  
  self.isAuthenticated = function()
    return self.available and self.authToken ~= nil and self.authToken ~= "0"   
  end

  -- ******************************************************
  self.log = function(msg)
    if self.logger ~= nil then
      self.logger(getTime2() .. "   " .. msg)
    end
  end
  
  -- ******************************************************
  self.saveSettings = function()
	local path = sys.get_save_file(sys.get_config("project.title"), "settings" .. tostring(self.name))
    local mytable = {}
    
	table.insert(mytable, self.authToken)
    
    if not sys.save(path, mytable) then
    	self.log("UNABLE TO SAVE SETTINGS")
    end
  end
  
  -- ******************************************************
  self.setAvailable = function(availability)
    if self.available ~= availability then
      self.available = availability
        
      if self.availabilityCallback ~= nil then
        self.availabilityCallback(availability)
      end
    end
  end
  
  -- ******************************************************
  self.setAuthenticated = function(userId)
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
  self.getHmac = function(nonce)
    return mime.b64(crypto.hmac(crypto.sha256, nonce, self.apiSecret, true))
  end
  
  -- ******************************************************
  self.processQueues = function(event)
    if self.writeDurableQueueIfDirty() then
      return
    end

	if self.internalConnected() and self.available then
      if not self.durableQueuePaused and self.durableNextDrainInterval < runtime.getTimer() then
        local length = LinkedList.length(self.persistentItemsToSend)
        local numDurableRequestsProcessed = 0

        for i = 1, length do
          local request = LinkedList.index(self.persistentItemsToSend, i - 1)
		
          if request.durableRetryTicks > 0 and request.durableRetryTicks >= runtime.getTimer() then
            numDurableRequestsProcessed = numDurableRequestsProcessed + 1
          end
        end
		
        for i = 1, length do
          if numDurableRequestsProcessed >= self.durableConcurrentRequests then
            break
          end

          local request = LinkedList.index(self.persistentItemsToSend, i - 1)
		
          if request.durableRetryTicks == 0 or request.durableRetryTicks < runtime.getTimer() then
            request.durableAttempts = request.durableAttempts + 1

            request.durableRetryTicks = runtime.getTimer() + request:getTimeoutMilliSeconds() + self.computeSleepPeriod(request.durableAttempts)
			
            local data = request:getData()
            
            data.requestId = "d_" .. getTime() .. "_" .. self.requestCounter

            self.requestCounter = self.requestCounter + 1

            --if request:getTimeoutMilliSeconds() ~= self.requestTimeout then
            --  data.timeout = request:getTimeoutMilliSeconds()
            --end
            
            local output = customjson.encode(data)
            
            self.log(output)
        
            self.internalSend(output)
        
            self.pendingRequests[data.requestId] = request

            numDurableRequestsProcessed = numDurableRequestsProcessed + 1
          end
        end
        self.durableNextDrainInterval = runtime.getTimer() + self.durableDrainInterval
      end
      
      if LinkedList.length(self.itemsToSend) > 0 then
        local request = LinkedList.popfirst(self.itemsToSend)
        local data = request:getData()
        local output = customjson.encode(data)
        
        self.log(output)
        
        self.internalSend(output)
        
        self.pendingRequests[data.requestId] = request
      end
    end
  end
  
  -- ******************************************************
  self.initialisePersistentQueue = function()
    if self.persistantQueueUserId == self.userId then
      return
    end
    
    local prevDurableQueuePaused = self.durableQueuePaused
    
    self.durableQueuePaused = true
    
    local queueArray = LinkedList.new()
    local queueString = self.loadPersistentQueue()
    
    if queueString ~= nil and #queueString > 0 then
      local lines = lines(queueString)
      
      for i,line in pairs(lines) do
        line = trim(line)
        if #line > 0 then
          local request = self.stringToRequest(line)
          
          if request ~= nil then
            LinkedList.pushlast(queueArray, request)
          end
        end
      end
    end
    
    self.persistentItemsToSend = queueArray
    
    self.persistantQueueUserId = self.userId
    
    self.durableQueuePaused = prevDurableQueuePaused
    
    self.log("persistantQueue COUNT: " .. LinkedList.length(self.persistentItemsToSend))
  end
  
  -- ******************************************************
  self.writeDurableQueueIfDirty = function()
    if self.durableQueueDirty then
      self.durableQueueDirty = false
   
      local lines = ""
      local length = LinkedList.length(self.persistentItemsToSend)
    
      for i = 1, length do
        local request = LinkedList.index(self.persistentItemsToSend, i - 1)
        local data = customjson.encode(request:getData())
        local queuedItem = {}
        
        queuedItem.rq = data
        queuedItem.sq = self.getHmac(data)
        
        local line = customjson.encode(queuedItem)
        
        lines = lines .. line .. "\n"
      end
      
      self.savePersistentQueue(lines)
      
      return true
    end
    
    return false
  end

  -- ******************************************************
  self.stringToRequest = function(line)
    local parsed = customjson.decode(line) 
    local data = parsed.rq
    local signature = parsed.sq
    local properSig = self.getHmac(data)
    
    if properSig == signature then
      return GSRequest.new(self, customjson.decode(data))
    end
    
    return nil
  end
  
  -- ******************************************************
  self.loadPersistentQueue = function() 
    if self.userId == nil then
      return nil
    end
    
    local path = sys.get_save_file(sys.get_config("project.title"), self.userId)
    local mytable = sys.load(path)
    local contents = nil

	if next(mytable) then
		contents = mytable[1]
	else
		self.log("UNABLE TO LOAD PERSISTENT QUEUE")
	end
    
    return contents
  end
  
  -- ******************************************************
  self.savePersistentQueue = function(queue) 
    if self.userId == nil then
      return nil
    end
    
    local path = sys.get_save_file(sys.get_config("project.title"), self.userId)
    local mytable = {}
    
	table.insert(mytable, queue)
    
    if not sys.save(path, mytable) then
    	self.log("UNABLE TO SAVE PERSISTENT QUEUE")
    end
  end
  
  -- ******************************************************
  self.buildServiceUrl = function()
    local stage
    local urlAddition = self.apiKey
    local credential
    local index
    
    if self.customUrlBase == nil or #self.customUrlBase <= 0 then
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
      self.url = self.url .. "?deviceOS=" .. self.deviceOS .. "&deviceID=" .. self.deviceID .. "&SDK=" .. self.SDK
    else
      self.url = self.customUrlBase .. "/" .. urlAddition
    end

    self.lbUrl = self.url
  end

  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.setCustomServiceUrl = function(url)
    self.customUrlBase = url
  end
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.getNumItemsToSend = function()
    return LinkedList.length(self.itemsToSend)
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.getNumPersistentItemsToSend = function()
    return LinkedList.length(self.persistentItemsToSend)
  end
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.setNetworkAvailable = function(available)
    self.networkAvailable = available
  end
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.getAuthToken = function()
    return self.authToken
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.setAuthToken = function(authToken)
    self.authToken = authToken
  end
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.clearDurableQueue = function()
    self.persistentItemsToSend = LinkedList.new()
    
    self.durableQueueDirty = true
    
    if self.userId == nil then
      return
    end
    
    local path = sys.get_save_file(sys.get_config("project.title"), self.userId)
    local mytable = {}
    
    sys.save(path, mytable)
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.setDurableQueuePaused = function(pause)
    self.durableQueuePaused = pause
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.compareAttributeDurableRequest = function(index, attributeName, attributeValue)
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
  self.removeDurableRequest = function(index)
    LinkedList.popWithIndex(self.persistentItemsToSend, index)
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.setCallbackDurableRequest = function(index, callback)
    local request = LinkedList.index(self.persistentItemsToSend, index)
    
    if request ~= nil then
      request:setCallback(callback)
    end
  end

  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.computeSleepPeriod = function(attempt)
    return math.random(0, math.min(self.retryMax, self.retryBase * 2 ^ attempt))
  end

  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.getRetryBase = function()
    return self.retryBase
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.setRetryBase = function(value)
    if value <= 0 then
      self.retryBase = self.origRetryBase
    else
      self.retryBase = value
    end
  end                    
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.getRetryMax = function()
    return self.retryMax
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.setRetryMax = function(value)
    if value <= self.retryBase then
      self.retryMax = self.origRetryMax
    else
      self.retryMax = value
    end
  end          
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.getRequestTimeout = function()
    return self.requestTimeout
  end
    
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.setRequestTimeout = function(value)
    if value <= 0 then
      self.requestTimeout = self.origRequestTimeout
    else
      self.requestTimeout = value
    end
  end          
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.getDurableConcurrentRequests = function()
    return self.durableConcurrentRequests
  end
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.setDurableConcurrentRequests = function(value)
    if value <= 0 then
      self.durableConcurrentRequests = self.origDurableConcurrentRequests
    else
      self.durableConcurrentRequests = value
    end
  end          
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.getDurableDrainInterval = function()
    return self.durableDrainInterval
  end
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.setDurableDrainInterval = function(value)
    if value <= 0 then
      self.durableDrainInterval = self.origDurableDrainInterval
    else
      self.durableDrainInterval = value
    end
  end          
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.getHandshakeOffset = function()
    return self.handshakeOffset
  end
  
  -- ******************************************************
  -- don't use this function
  -- ******************************************************
  self.setHandshakeOffset = function(value)
    if value <= 0 then
      self.handshakeOffset = self.origHandshakeOffset
    else
      self.handshakeOffset = value
    end
  end        

  -- ******************************************************
  return {
    GSRequestBuilder = self.requestBuilder,                           -- don't use this member
    GSMessageHandler = self.messageHandler,                           -- don't use this member
    
    setAvailabilityCallback = self.setAvailabilityCallback,
    setAuthenticatedCallback = self.setAuthenticatedCallback,
    setMessageHandlerCallback = self.setMessageHandlerCallback,
    setUseLiveServices = self.setUseLiveServices,
    setApiSecret = self.setApiSecret,
    setApiKey = self.setApiKey,
    setApiCredential = self.setApiCredential,
    setLogger = self.setLogger,
    connect = self.connect,
    send = self.send,
    disconnect = self.disconnect,
    reset = self.reset,
    getRequestBuilder = self.getRequestBuilder,
    getMessageHandler = self.getMessageHandler,
    getDeviceStats = self.getDeviceStats,
    isAvailable = self.isAvailable,
    isAuthenticated = self.isAuthenticated,
    
    setCustomServiceUrl = self.setCustomServiceUrl,                       -- don't use this function
    getNumItemsToSend = self.getNumItemsToSend,                           -- don't use this function
    getNumPersistentItemsToSend = self.getNumPersistentItemsToSend,       -- don't use this function
    setNetworkAvailable = self.setNetworkAvailable,                       -- don't use this function
    getAuthToken = self.getAuthToken,                                     -- don't use this function
    setAuthToken = self.setAuthToken,                                     -- don't use this function
    clearDurableQueue = self.clearDurableQueue,                           -- don't use this function
    setDurableQueuePaused = self.setDurableQueuePaused,                   -- don't use this function
    compareAttributeDurableRequest = self.compareAttributeDurableRequest, -- don't use this function
    removeDurableRequest = self.removeDurableRequest,                     -- don't use this function
    setCallbackDurableRequest = self.setCallbackDurableRequest,           -- don't use this function
    computeSleepPeriod = self.computeSleepPeriod,                         -- don't use this function
    getRetryBase = self.getRetryBase,                                     -- don't use this function
    setRetryBase = self.setRetryBase,                                     -- don't use this function           
    getRetryMax = self.getRetryMax,                                       -- don't use this function
    setRetryMax = self.setRetryMax,                                       -- don't use this function
    getRequestTimeout = self.getRequestTimeout,                           -- don't use this function
    setRequestTimeout = self.setRequestTimeout,                           -- don't use this function
    getDurableConcurrentRequests = self.getDurableConcurrentRequests,     -- don't use this function
    setDurableConcurrentRequests = self.setDurableConcurrentRequests,     -- don't use this function
    getDurableDrainInterval = self.getDurableDrainInterval,               -- don't use this function
    setDurableDrainInterval = self.setDurableDrainInterval,               -- don't use this function
    getHandshakeOffset = self.getHandshakeOffset,                         -- don't use this function
    setHandshakeOffset = self.setHandshakeOffset                          -- don't use this function
  }
end
