--GameSparksRT = GameSparksRT or require("gamesparks.realtime.GameSparksRT")
PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")
YaciCode12 = YaciCode12 or require("gamesparks.realtime.YaciCode12")

RTRequest = newclass("RTRequest")

function RTRequest:init()
  self.data = nil
  self.opCode = 0
  self.targetPlayers = {}
  self.intent = GameSparksRT.deliveryIntent.RELIABLE
end

function RTRequest:toPacket(session, fast)
  return nil
end
RTRequest:virtual("toPacket") 

function RTRequest:reset()
  self.targetPlayers = {}
  
  collectgarbage("collect")
end

function RTRequest:serialize(stream)
end
RTRequest:virtual("serialize") 

return RTRequest