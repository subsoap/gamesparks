Sockets = Sockets or require("gamesparks.dmc_corona.dmc_sockets")
Connection = Connection or require("gamesparks.realtime.connection.Connection")
--GameSparksRT = GameSparksRT or require("gamesparks.realtime.GameSparksRT")
LoginCommand = LoginCommand or require("gamesparks.realtime.commands.requests.LoginCommand")
Packet = Packet or require("gamesparks.realtime.proto.Packet")
PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")

local FastConnection = {}
local FastConnection_mt = {__index = FastConnection}

function FastConnection.new(session)
  local instance = Connection.new(session)
  
  instance.reconnectSleep = 100
  
  instance.client = Sockets:create(Sockets.UDP) 
  instance.remotehost = ""
  instance.remoteport = 0
  
  return setmetatable(instance, FastConnection_mt)
end

setmetatable(FastConnection, {__index = Connection})

function FastConnection:start(remotehost, remoteport)
  self.remotehost = remotehost
  self.remoteport = remoteport
  
  self.client:addEventListener(self.client.EVENT, self)
  self.client:connect(remotehost, remoteport, {size = GameSparksRT.MAX_UNRELIABLE_MESSAGE_SIZE_BYTES})
end

function FastConnection:udp_socket_event(event)
  local status = event.status
   
  if self.client ~= nil and event.type == self.client.CONNECT then
    if status == self.client.CONNECTED then
      --print( 'socket status:', status )

      self.session:log("FastConnection", GameSparksRT.logLevel.DEBUG, " UDP Socket Connected")
      
      self.session:log("FastConnection", GameSparksRT.logLevel.DEBUG, " local=" .. self.client:getLocalHostName() .. " remote=" .. self.remotehost .. ":" .. self.remoteport)
  
      self:doLogin()
    else
      --print( 'socket status:', status )

      if self.session ~= nil then
        self.session:log("FastConnection", GameSparksRT.logLevel.DEBUG, " UDP Socket Disconnected")
      end
    end
  elseif self.client ~= nil and event.type == self.client.READ then
    --print( "=== UDP Data Available ===" )
    --print( 'socket status:', status )
    
    if self.stopped then
      self.client:close()
      self.client = nil
      
      return
    end

    local data = self.client:receive()
    local read = event.bytes
    local ms = Stream.new()
    
    ms:writeChars(data, 0, #data)
        
    ms:setPosition(0)
    
    --print(ms:getLength())
    --print(ms:toHex())
    
    while ms:getPosition() < read do
      local p = PooledObjects.packetPool:pop()
      local packetSize
    
      if not self.stopped then
        p.session = self.session
        p.reliable = false
        
        packetSize = Packet.deserializeLengthDelimited(ms, p)
        
        if p.reliable == nil then
          p.reliable = false
        end
      else
        packetSize = 0
      end
      
      self:onPacketReceived(p, packetSize)
      
      PooledObjects.packetPool:push(p)
    end
  end
end

function FastConnection:doLogin()
  if self.session ~= nil then
    if self.session.connectState < GameSparksRT.connectState.RELIABLE_AND_FAST_SEND then
      local loginCmd = LoginCommand.new(self.session.connectToken)
  
      self:send(loginCmd)    
        
      timer.seconds(self.reconnectSleep / 1000, function() self:doLogin() end)
    else
      self.session:onReady(true)
    end
  end
end

function FastConnection:send(request)
  --print("sendfast", self.client.status)
  if self.client ~= nil and self.client.status == self.client.CONNECTED then
    local ret
    local ms = PooledObjects.memoryStreamPool:pop()
  
    ms:setPosition(0)
    
    local p = request:toPacket(self.session, true)
    --print(p:toString())
    --print("a", ms:getPosition(), ms:getLength())
    Packet.serializeLengthDelimited(ms, p)
    --print("b", ms:getPosition(), ms:getLength())
    PooledObjects.packetPool:push(p)
    
    self.client:send(string.sub(ms:toString(), 1, ms:getPosition()))
  
    ret = ms:getPosition()
    
    PooledObjects.memoryStreamPool:push(ms)
   
    return ret
  else
    return -1
  end
end

function FastConnection:stopInternal()
  if self.client ~= nil and self.client.status == self.client.CONNECTED then
    self.client:close()
  end

  self.client = nil
  
  self.session = nil
end
  
return FastConnection
