RTRequest = RTRequest or require("gamesparks.realtime.commands.requests.RTRequest")
PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")

local CustomRequest = {}
local CustomRequest_mt = {__index = CustomRequest}

PooledObjects.customRequestPool = ObjectPool.new(function()
  return CustomRequest.new()
end, function(cr)
  cr:reset()
end, 5)

function CustomRequest.new()
  local instance = RTRequest.new()
  
  instance.payload = nil

  return setmetatable(instance, CustomRequest_mt)
end

setmetatable(CustomRequest, {__index = RTRequest})

function CustomRequest:configure(opCode, intent, payload, data, targetPlayers)
  self.opCode = opCode
  self.payload = payload
  self.intent = intent
  self.data = data
  if targetPlayers ~= nil then
    for _, v in ipairs(targetPlayers) do 
      self.targetPlayers[#self.targetPlayers + 1] = v 
    end
  end
end

function CustomRequest:toPacket(session, fast)
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

function CustomRequest:serialize(stream)
  if self.payload then
    stream:writeBytes(self.payload, 0, #self.payload)
  end
end

function CustomRequest:reset()
  self.payload = nil
  RTRequest.reset(self)
end

return CustomRequest
