LinkedList = LinkedList or require("gamesparks.LinkedList")
--GameSparksRT = GameSparksRT or require("gamesparks.realtime.GameSparksRT")
PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")
ReliableConnection = ReliableConnection or require("gamesparks.realtime.connection.ReliableConnection")
FastConnection = FastConnection or require("gamesparks.realtime.connection.FastConnection")
CustomRequest = CustomRequest or require("gamesparks.realtime.commands.requests.CustomRequest")
ActionCommand = ActionCommand or require("gamesparks.realtime.commands.ActionCommand")
LogCommand = LogCommand or require("gamesparks.realtime.commands.LogCommand")

local RTSessionImpl = {}
local RTSessionImpl_mt = {__index = RTSessionImpl}

function RTSessionImpl.new(connectToken, hostName, tcpPort, udpPort, listener)
  local instance = {}
  
  instance.connectToken = connectToken
  instance.tcpPort = tcpPort
  instance.fastPort = udpPort
  instance.hostName = hostName
  instance.activePeers = {}
  instance.running = false
  instance.ready = false
  instance.actionQueue = LinkedList.new()
  instance.connectState = GameSparksRT.connectState.DISCONNECTED
  instance.mustConnnectBy = os.time()
  instance.reliableConnection = nil
  instance.fastConnection = nil
  instance.sequenceNumber = 0
  instance.peerId = nil
  instance.peerMaxSequenceNumbers = {}
  instance.listener = listener
  
  return setmetatable(instance, RTSessionImpl_mt)
end

function RTSessionImpl:start()
  self.running = true
end

function RTSessionImpl:stop()
  self:log("IRTSession", GameSparksRT.logLevel.DEBUG, "Stopped")

  self.running = false
  self.ready = false
  
  if self.fastConnection ~= nil then
    self.fastConnection:stop()
  end

  if self.reliableConnection ~= nil then
    self.reliableConnection:stop()
  end
  
  self:setConnectState(GameSparksRT.connectState.DISCONNECTED)
end

function RTSessionImpl:update() 
  if self.running then
    self:checkConnection()
  end

  local toExecute = nil 
  
  while true do
    toExecute = self:getNextAction()
    if toExecute ~= nil then
      toExecute:execute()
    else
      break
    end
  end
end

function RTSessionImpl:getNextAction()
  if LinkedList.length(self.actionQueue) > 0 then            
    return LinkedList.popfirst(self.actionQueue)
  end
  
  return nil
end

function RTSessionImpl:submitAction(action)      
  LinkedList.pushlast(self.actionQueue, action)
end

function RTSessionImpl:checkConnection()
  if self.connectState == GameSparksRT.connectState.DISCONNECTED then
    self:log("IRTSession", GameSparksRT.logLevel.INFO, "Disconnected, trying to connect")
    
    self:setConnectState(GameSparksRT.connectState.CONNECTING)
              
    self:connectReliable()
  elseif self.connectState == GameSparksRT.connectState.CONNECTING and os.time() > self.mustConnnectBy then
    self:setConnectState(GameSparksRT.connectState.DISCONNECTED)
    
    self:log("IRTSession", GameSparksRT.logLevel.INFO, "Not connected in time, retrying")

    if self.reliableConnection ~= nil then
      self.reliableConnection:stopInternal()
      self.reliableConnection = nil
    end
    if self.fastConnection ~= nil then
      self.fastConnection:stopInternal()
      self.fastConnection = nil
    end
  end
end

function RTSessionImpl:setConnectState(value)
  if value ~= self.connectState then
    if self.connectState < value or value == GameSparksRT.connectState.DISCONNECTED then
      self:log("IRTSession", GameSparksRT.logLevel.DEBUG, "State Change : from " .. self.connectState .. " to " .. value .. ", ActivePeers " .. table.getn(self.activePeers))
      
      self.connectState = value
    end
  end
end

function RTSessionImpl:connectFast()
  self:log("IRTSession", GameSparksRT.logLevel.DEBUG, self.peerId .. ": Creating new fastConnection to " .. self.fastPort)
  
  self.fastConnection = FastConnection.new(self)
  self.fastConnection:start(self.hostName, self.fastPort)
end

function RTSessionImpl:connectReliable()
  self.mustConnnectBy = os.time() + GameSparksRT.TCP_CONNECT_TIMEOUT_SECONDS
  
  self.reliableConnection = ReliableConnection.new(self.hostName, self.tcpPort, self)
end

function RTSessionImpl:nextSequenceNumber()
  local sequenceNumber = self.sequenceNumber
  
  self.sequenceNumber = self.sequenceNumber + 1
  
  return sequenceNumber
end

function RTSessionImpl:shouldExecute(peerId, sequence)
  if sequence == nil then
    return true
  elseif self.peerMaxSequenceNumbers[peerId] == nil then
    self.peerMaxSequenceNumbers[peerId] = 0
  end

  if self.peerMaxSequenceNumbers[peerId] > sequence then
    self:log("IRTSession", GameSparksRT.logLevel.DEBUG, "Discarding sequence id " .. sequence .. " from peer " .. peerId)
   
    return false
  else
    self.peerMaxSequenceNumbers[peerId] = sequence
    
    return true
  end
end

function RTSessionImpl:resetSequenceForPeer(peerId)
  if self.peerMaxSequenceNumbers[peerId] then
    self.peerMaxSequenceNumbers[peerId] = 0
  end
end

function RTSessionImpl:onPlayerConnect(peerId)
  self:resetSequenceForPeer(peerId)
  if self.listener ~= nil then
    if self.ready then
      self.listener:onPlayerConnect(peerId)
    end
  end
end

function RTSessionImpl:onPlayerDisconnect(peerId)
  if self.listener ~= nil then
    if self.ready then
      self.listener:onPlayerDisconnect(peerId)
    end
  end
end

function RTSessionImpl:onReady(ready)
  if not self.ready and ready then             
    self:sendData(OpCodes.PLAYER_READY_MESSAGE, GameSparksRT.deliveryIntent.RELIABLE, nil, nil)            
    if self.peerId then
      local ok = false
      
      for k, v in ipairs(self.activePeers) do 
        if self.activePeers[k] == self.peerId then
          ok = true
          
          break
        end
      end
      
      if not ok then
        table.insert(self.activePeers, self.peerId)
      end
    end
  end

  self.ready = ready

  if not self.ready then
    self:setConnectState(GameSparksRT.connectState.DISCONNECTED)
  end

  if self.listener ~= nil then
    self:submitAction(ActionCommand.pool:pop():configure(function()
      self.listener:onReady(ready)
    end))
  end
end

function RTSessionImpl:onPacket(packet)
  if self.listener ~= nil then
    self.listener:onPacket(packet)
  else
    error("AccessViolationException")
  end
end

function RTSessionImpl:sendData(opCode, intent, payload, data, targetPlayers)
  return self:sendRTDataAndBytes(opCode, intent, payload, data, targetPlayers)
end

function RTSessionImpl:sendRTData(opCode, intent, data, targetPlayers)
  return self:sendRTDataAndBytes(opCode, intent, nil, data, targetPlayers)
end

function RTSessionImpl:sendBytes(opCode, intent, payload, targetPlayers)
  return self:sendRTDataAndBytes(opCode, intent, payload, nil, targetPlayers)
end

function RTSessionImpl:sendRTDataAndBytes(opCode, intent, payload, data, targetPlayers)
  local csr = PooledObjects.customRequestPool:pop()
  local ret
  
  csr:configure(opCode, intent, payload, data, targetPlayers)
  if intent ~= GameSparksRT.deliveryIntent.RELIABLE and self.connectState >= GameSparksRT.connectState.RELIABLE_AND_FAST_SEND then
    ret = self.fastConnection:send(csr)
    
    PooledObjects.customRequestPool:push(csr)
    
    return ret
  elseif self.connectState >= GameSparksRT.connectState.RELIABLE_ONLY then
    ret = self.reliableConnection:send(csr)
    
    PooledObjects.customRequestPool:push(csr)
    
    return ret
  end
       
  PooledObjects.customRequestPool:push(csr)  
         
  return 0
end

function RTSessionImpl:log(tag, level, msg)
  if GameSparksRT.shouldLog(tag, level) then
    self:submitAction(LogCommand.pool:pop():configure(self, tag, level, msg))
  end
end

return RTSessionImpl