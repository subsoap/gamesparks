PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")
RTPacket = RTPacket or require("gamesparks.realtime.RTPacket")

local CustomCommand = {}
local CustomCommand_mt = {__index = CustomCommand}

CustomCommand.pool = ObjectPool.new(function()
  return CustomCommand.new()
end, nil, 5)

function CustomCommand.new()
  local instance = {}
  
  instance.session = nil
  instance.opCode = 0
  instance.sender = 0
  instance.limit = 0
  instance.packetSize = 0
  instance.ms = nil
  instance.limitedStream = nil
  instance.data = nil

  return setmetatable(instance, CustomCommand_mt)
end

function CustomCommand:configure(opCode, sender, lps, data, limit, session, packetSize)
  self.ms = PooledObjects.memoryStreamPool:pop()
  self.packetSize = packetSize
  self.opCode = opCode
  self.sender = sender
  self.data = data
  self.session = session
  self.limit = limit
  self.limitedStream = nil

  if lps ~= nil then
    self.limitedStream = PooledObjects.limitedPositionStreamPool:pop()

    for i = 1, limit do
      local read = lps:readByte()
      
      self.ms:writeByte(read)
    end
    self.ms:setPosition(0)
    self.limitedStream:wrap(self.ms, limit)
  end

  return self
end

function CustomCommand:execute()
  self.session:onPacket(RTPacket.new(self.opCode, self.sender, self.limitedStream, self.limit, self.data, self.packetSize))
  
  PooledObjects.memoryStreamPool:push(self.ms)
  PooledObjects.limitedPositionStreamPool:push(self.limitedStream)
  CustomCommand.pool:push(self)
end

return CustomCommand