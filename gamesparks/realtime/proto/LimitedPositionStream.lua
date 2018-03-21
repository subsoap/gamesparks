PositionStream = PositionStream or require("gamesparks.realtime.proto.PositionStream")
PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")

local LimitedPositionStream = {}
local LimitedPositionStream_mt = {__index = LimitedPositionStream}

function LimitedPositionStream.new()
  local instance = PositionStream.new()

  instance.limit = 0

  return setmetatable(instance, LimitedPositionStream_mt)
end

setmetatable(LimitedPositionStream, {__index = PositionStream})

PooledObjects.limitedPositionStreamPool = ObjectPool.new(function()
  return LimitedPositionStream.new()
end, nil, 5)

function LimitedPositionStream:wrap(baseStream, limit)
  PositionStream.wrap(self, baseStream)
  
  self.limit = limit
end

function LimitedPositionStream:read(buffer, offset, count)
  local toRead
  
  if count > self.limit - self.bytesRead then
    toRead = self.limit - self.bytesRead
  else
    toRead = count
  end
  
  return PositionStream.read(self, buffer, offset, toRead)
end

function LimitedPositionStream:readByte()
  if self.bytesRead >= self.limit then
    return -1
  else
    return PositionStream.readByte(self)
  end
end

function LimitedPositionStream:skipToEnd()
  if self.bytesRead < self.limit then
    local discardBytes = PooledObjects.byteBufferPool:pop()
    
    while (self:read(discardBytes, self.bytesRead, 256) == 256) do
    end
    
    PooledObjects.byteBufferPool:push(discardBytes)
  end
end

return LimitedPositionStream
  
