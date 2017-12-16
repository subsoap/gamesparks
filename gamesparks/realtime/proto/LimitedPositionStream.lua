YaciCode12 = YaciCode12 or require("gamesparks.realtime.YaciCode12")
PositionStream = PositionStream or require("gamesparks.realtime.proto.PositionStream")
PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")

LimitedPositionStream = newclass("LimitedPositionStream", PositionStream)

PooledObjects.limitedPositionStreamPool = ObjectPool.new(function()
  return LimitedPositionStream:new()
end, nil, 5)

function LimitedPositionStream:init()
  self.super:init()
  self.limit = 0
end

function LimitedPositionStream:wrap(baseStream, limit)
  self.super:wrap(baseStream)
  
  self.limit = limit
end

function LimitedPositionStream:read(buffer, offset, count)
  local toRead
  
  if count > self.limit - self.bytesRead then
    toRead = self.limit - self.bytesRead
  else
    toRead = count
  end
  
  return self.super:read(buffer, offset, toRead)
end

function LimitedPositionStream:readByte()
  if self.bytesRead >= self.limit then
    return -1
  else
    return self.super:readByte()
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
  