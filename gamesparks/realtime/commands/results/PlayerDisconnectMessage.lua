--GameSparksRT = GameSparksRT or require("gamesparks.realtime.GameSparksRT")
AbstractResult = AbstractResult or require("gamesparks.realtime.commands.results.AbstractResult")
ObjectPool = ObjectPool or require("gamesparks.realtime.pools.ObjectPool")
ProtocolParser = ProtocolParser or require("gamesparks.realtime.proto.ProtocolParser")
require("gamesparks.GSUtils")

local PlayerDisconnectMessage = {}
local PlayerDisconnectMessage_mt = {__index = PlayerDisconnectMessage}
    
PlayerDisconnectMessage.pool = ObjectPool.new(function()
  return PlayerDisconnectMessage.new()
end, function(instance)
  instance.activePeers = {}
end, 5)

function PlayerDisconnectMessage.new()
  local instance = AbstractResult.new()
  
  instance.peerId = 0
  instance.activePeers = {}
  
  return setmetatable(instance, PlayerDisconnectMessage_mt)
end

setmetatable(PlayerDisconnectMessage, {__index = AbstractResult})

function PlayerDisconnectMessage:execute()
  self.session.activePeers = {}
  self.session.activePeers = table.copy(self.activePeers)
  self.session:log("PlayerDisconnectMessage", GameSparksRT.logLevel.DEBUG, "PeerId=" .. self.peerId .. ", ActivePeers" .. table.getn(self.session.activePeers))
  self.session:onPlayerDisconnect(self.peerId)
  
  PlayerDisconnectMessage.pool:push(self)
end

function PlayerDisconnectMessage.deserialize(stream, instance)
  if instance.activePeers == nil then
    instance.activePeers = {}
  end
  
  while true do
    local keyByte = stream:readByte()
    
    if keyByte == -1 then
      break
    end
    
    local continue = false
    
    if keyByte == 8 then
      instance.peerId = ProtocolParser.readUInt64(stream)
      
      continue = true
    elseif keyByte == 32 then
      table.insert(instance.activePeers, ProtocolParser.readUInt64(stream))
      
      continue = true
    end
    
    if not continue then
      local key = ProtocolParser.readKey(keyByte, stream)

      if key.field == 0 then
        print("WARNING: " .. "Invalid field id: 0, something went wrong in the stream")
        
        return nil
      else
        ProtocolParser.skipKey(stream, key)
      end
    end
  end

  return instance
end

return PlayerDisconnectMessage