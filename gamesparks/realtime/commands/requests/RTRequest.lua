--GameSparksRT = GameSparksRT or require("gamesparks.realtime.GameSparksRT")
PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")

local RTRequest = {}
local RTRequest_mt = {__index = RTRequest}

function RTRequest.new()
  local instance = {}
  
  instance.data = nil
  instance.opCode = 0
  instance.targetPlayers = {}
  instance.intent = GameSparksRT.deliveryIntent.RELIABLE
  
  return setmetatable(instance, RTRequest_mt)
end

function RTRequest:toPacket(session, fast)
  return nil
end

function RTRequest:reset()
  self.targetPlayers = {}
  collectgarbage("collect")
end

function RTRequest:serialize(stream)
end 

return RTRequest
