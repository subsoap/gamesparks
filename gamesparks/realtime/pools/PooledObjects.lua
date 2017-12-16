ObjectPool = ObjectPool or require("gamesparks.realtime.pools.ObjectPool")
Stream = require("gamesparks.realtime.proto.Stream")

PooledObjects = {}

PooledObjects.packetPool = {}

PooledObjects.memoryStreamPool = ObjectPool.new(function()
  return Stream:new()
end, function(stream)
  stream:setPosition(0)
end, 5)

PooledObjects.positionStreamPool = {}

PooledObjects.limitedPositionStreamPool = {}

PooledObjects.byteBufferPool = ObjectPool.new(function()
  local array = {}
    
  for i = 1, 256 do
    array[i] = 0
  end
  
  return array
end, nil, 5)

PooledObjects.customRequestPool = {}

return PooledObjects