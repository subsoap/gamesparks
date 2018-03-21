Sockets = Sockets or require("gamesparks.dmc_corona.dmc_sockets")
Connection = Connection or require("gamesparks.realtime.connection.Connection")
LoginCommand = LoginCommand or require("gamesparks.realtime.commands.requests.LoginCommand")
Packet = Packet or require("gamesparks.realtime.proto.Packet")
PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")
Stream = Stream or require("gamesparks.realtime.proto.Stream")

local ReliableConnection = {}
local ReliableConnection_mt = {__index = ReliableConnection}

function ReliableConnection.new(remotehost, remoteport, session)
  local instance = Connection.new(session)
  
  instance.client = Sockets:create(Sockets.ATCP, {timeout=session.mustConnnectBy})
  instance.client.secure = true
  
  instance.onConnect = function(event)
    if instance.client ~= nil and event.status == instance.client.CONNECTED then
      --print("reliable connected")
      
      if instance.stopped or instance.session == nil then
        if instance.client ~= nil then
          instance.client:close()
          instance.client = nil
        end
        
        return
      end 

      instance.session:log("ReliableConnection", GameSparksRT.logLevel.DEBUG, " TCP Connection Established")
      
      local loginCmd = LoginCommand.new(instance.session.connectToken)

      instance:send(loginCmd)
    elseif instance.client ~= nil and event.status == instance.client.CLOSED then
      --print("reliable closed")
      if instance.session ~= nil then
        instance.session:log("ReliableConnection", GameSparksRT.logLevel.DEBUG, " TCP Connection Closed")
      end

      --if not instance.stopped and instance.client ~= nil then
        --timer.performWithDelay(1000, function() 
        --  if instance.session ~= nil then 
        --    instance.session:log("ReliableConnection", GameSparksRT.logLevel.DEBUG, " Reconnecting") 
        --  end

        --  instance.client:reconnect( { onConnect = instance.onConnect } ) 
        --end)
      if not instance.stopped then
        if instance.session ~= nil then 
          instance.session:onReady(false)
        end

        instance:stop()
      end
    else
      --print("reliable error")
      if instance.session ~= nil then
        instance.session:log("ReliableConnection", GameSparksRT.logLevel.DEBUG, " TCP Connection Error")
      end

      print(event.emsg)
    end
  end
  
  instance.client:connect(remotehost, remoteport, {onData = function(event)
    --print("### onData",instance.session.peerId, event.type,event.status,event.bytes)
    if event.type == instance.client.READ then
      if instance.stopped then
        if instance.client ~= nil then
          instance.client:close()
          instance.client = nil
        end
        
        return
      end
      
      local callback = function(s_event)
        local data = s_event.data
        local read = #data
        local rss = Stream.new()
        
        rss:writeChars(data, 0, read)
        
        rss:setPosition(0)
  
        --print(rss:getLength())
        --print(rss:toHex())

        -- TODO: fix malformed stream
        while rss:getPosition() < read do
          local p = PooledObjects.packetPool:pop()
          local bytesRead = instance:read(rss, p)
        
          instance:onPacketReceived(p, bytesRead)
          PooledObjects.packetPool:push(p)
          --p = PooledObjects.packetPool:pop()
        end
      end
  
      instance.client:receive( '*a', callback )
    end
  
  end, onConnect = instance.onConnect})
  
  return setmetatable(instance, ReliableConnection_mt)
end

setmetatable(ReliableConnection, {__index = Connection})

function ReliableConnection:send(request)
  --print("sendreliable", self.client.status)
  if self.client ~= nil and self.client.status == self.client.CONNECTED then
    local stream = Stream.new()
    local p = request:toPacket(self.session, false)
    --print(p:toString())
    --print("a", stream:getPosition(), stream:getLength())
    
    local ret = Packet.serializeLengthDelimited(stream, p)
    --print("b", stream:getPosition(), stream:getLength())
    
    self.client:send(stream:toString())

    PooledObjects.packetPool:push(p)
    
    return ret
  else
    return -1
  end
end

function ReliableConnection:read(stream, p)
  if self.stopped then
    return 0
  end
  
  p.session = self.session
  p.reliable = true
  
  local ret = Packet.deserializeLengthDelimited(stream, p)
  --print("ret", ret)
  
  if p.reliable == nil then
    p.reliable = true
  end
 
  return ret
end

function ReliableConnection:stopInternal()
  if self.client ~= nil and self.client.status == self.client.CONNECTED then
    self.client:close()
  end

  self.client = nil
  
  self.session = nil
end

return ReliableConnection
