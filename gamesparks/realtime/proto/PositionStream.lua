--PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")
--Stream = Stream or require("gamesparks.realtime.proto.Stream")

local PositionStream = {}
local PositionStream_mt = {__index = PositionStream}

function PositionStream.new()
  local instance = {}
  
  instance.tempBuffer = {}
  instance.bytesRead = 0
  instance.stream = nil
  
  return setmetatable(instance, PositionStream_mt)
end

PooledObjects.positionStreamPool = ObjectPool.new(function()
  return PositionStream.new()
end, nil, 5)

function PositionStream:wrap(baseStream)
  self.bytesRead = 0
  self.stream = baseStream
end

function PositionStream:read(buffer, offset, count)
  local read = self.stream:read(buffer, offset, count)
  
  self.bytesRead = self.bytesRead + read
  
  return read
end

function PositionStream:readByte()  
  if self:read(self.tempBuffer, 0, 1) == 1 then
    return self.tempBuffer[1]
  end
  
  return -1
end

function PositionStream:seek(offset)
  for i = 1, offset do
    self:readByte()
  end
  
  return self.bytesRead
end

function PositionStream:getLength()
  return self.stream:getLength()
end

function PositionStream:getPosition()
  return self.bytesRead
end

return PositionStream
