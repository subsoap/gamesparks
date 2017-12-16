--PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")
local YaciCode12 = require("gamesparks.realtime.YaciCode12")
--Stream = Stream or require("gamesparks.realtime.proto.Stream")

PositionStream = newclass("PositionStream")

--PooledObjects.positionStreamPool = ObjectPool.new(function()
--  return PositionStream:new()
--end, nil, 5)

function PositionStream:init()
  self.tempBuffer = {}
  self.bytesRead = 0
  self.stream = nil
end

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
