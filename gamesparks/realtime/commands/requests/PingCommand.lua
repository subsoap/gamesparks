YaciCode12 = YaciCode12 or require("gamesparks.realtime.YaciCode12")
RTRequest = RTRequest or require("gamesparks.realtime.commands.requests.RTRequest")

PingCommand = newclass("PingCommand", RTRequest)

function PingCommand:init()
  self.super:init()
  
  self.opCode = -2
end

function PingCommand:toPacket(session, fast)
  local p = PooledObjects.packetPool:pop()
  
  p.opCode = self.opCode
  p.data = self.data
  p.session = session

  if not fast and self.intent ~= GameSparksRT.deliveryIntent.RELIABLE then
    p.reliable = false
  end

  if self.intent == GameSparksRT.deliveryIntent.UNRELIABLE_SEQUENCED then
    p.sequenceNumber = session:nextSequenceNumber()
  end

  if #self.targetPlayers > 0 then
    p.targetPlayers = self.targetPlayers
  end

  p.request = self
  
  return p
end

function PingCommand:serialize(stream)
end

return PingCommand