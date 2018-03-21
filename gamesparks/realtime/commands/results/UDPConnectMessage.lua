--GameSparksRT = GameSparksRT or require("gamesparks.realtime.GameSparksRT")
AbstractResult = AbstractResult or require("gamesparks.realtime.commands.results.AbstractResult")
ObjectPool = ObjectPool or require("gamesparks.realtime.pools.ObjectPool")
ProtocolParser = ProtocolParser or require("gamesparks.realtime.proto.ProtocolParser")

local UDPConnectMessage = {}
local UDPConnectMessage_mt = {__index = UDPConnectMessage}
    
UDPConnectMessage.pool = ObjectPool.new(function()
  return UDPConnectMessage.new()
end, nil, 5)

function UDPConnectMessage.new()
  local instance = AbstractResult.new()
  
  return setmetatable(instance, UDPConnectMessage_mt)
end

setmetatable(UDPConnectMessage, {__index = AbstractResult})

function UDPConnectMessage:execute()
  local reliable
  
  if self.packet.reliable ~= nil then
    reliable = self.packet.reliable
  else
    reliable = false
  end
  
  self.session:log("UDPConnectMessage", GameSparksRT.logLevel.DEBUG, "(UDP) reliable=" .. tostring(reliable) .. ", ActivePeers " .. table.getn(self.session.activePeers))
  
  if not reliable then 
    self.session:setConnectState(GameSparksRT.connectState.RELIABLE_AND_FAST)
    self.session:sendData(-5, GameSparksRT.deliveryIntent.RELIABLE, nil, nil)
  else
    self.session:log("UDPConnectMessage", GameSparksRT.logLevel.DEBUG, "TCP (Unexpected) UDPConnectMessage")
  end
     
  UDPConnectMessage.pool:push(self)
end

function UDPConnectMessage:executeAsync()
  return false
end

function UDPConnectMessage.deserialize(stream, instance)
  while true do
    local keyByte = stream:readByte()
    
    if keyByte == -1 then
      break
    end
    
    local key = ProtocolParser.readKey(keyByte, stream)

    if key.field == 0 then
      print("WARNING: " .. "Invalid field id: 0, something went wrong in the stream")
      
      break
    else
      if ProtocolParser.skipKey(stream, key) ~= true then
        break
      end
    end
  end

  return instance
end

return UDPConnectMessage
