ObjectPool = ObjectPool or require("gamesparks.realtime.pools.ObjectPool")
Wire = Wire or require("gamesparks.realtime.proto.Wire")
ProtocolParser = ProtocolParser or require("gamesparks.realtime.proto.ProtocolParser")
--local bit = require("plugin.bit")

RTDataSerializer = {}

RTDataSerializer.cache = {}

function RTDataSerializer.get()
  return RTDataSerializer.cache:pop()
end

function RTDataSerializer.readRTData(stream, instance)
  if instance == nil then
    instance = RTDataSerializer.cache:pop()
  end
  
  local limit = ProtocolParser.readUInt32(stream)
 
  limit = limit + stream:getPosition()
  
  while true do
    if stream:getPosition() >= limit then
      if stream:getPosition() == limit then
        break
      else
        print("WARNING: " .. "Read past max limit")
        
        return nil
      end
    end
    
    local keyByte = stream:readByte()
    
    if keyByte == -1 then
      break
    end
    
    local key = ProtocolParser.readKey(keyByte, stream)
    
    if key.wireType == Wire.VARINT then
      instance.data[key.field] = RTVal.newLong(ProtocolParser.readZInt64(stream))
    elseif key.wireType == Wire.FIXED32 then
      instance.data[key.field] = RTVal.newFloat(ProtocolParser.readSingle(stream))
    elseif key.wireType == Wire.FIXED64 then
      instance.data[key.field] = RTVal.newDouble(ProtocolParser.readDouble(stream))
    elseif key.wireType == Wire.LENGTH_DELIMITED then
      instance.data[key.field] = RTVal.deserializeLengthDelimited(stream)
    end
        
    if key.field == 0 then
      print("WARNING: " .. "Invalid field id: 0, something went wrong in the stream")
      
      return nil
    end
  end
  
  return instance
end

function RTDataSerializer.writeRTData(stream, instance)
  local ms = PooledObjects.memoryStreamPool:pop()
  
  --print("a", ms:getPosition())
  
  --print(instance, instance.data, instance.name)

  for index = 1, #instance.data do
    local entry = instance.data[index]
    
    if entry.long_val then
      ProtocolParser.writeUInt32(ms, bit.lshift(index, 3))
      
      ProtocolParser.writeZInt64(ms, entry.long_val)
    elseif entry.float_val then
      ProtocolParser.writeUInt32(ms, bit.bor(bit.lshift(index, 3), 5))
        
      ProtocolParser.writeSingle(ms, entry.float_val)
    elseif entry.double_val then
      ProtocolParser.writeUInt32(ms, bit.bor(bit.lshift(index, 3), 1))
        
      ProtocolParser.writeDouble(ms, entry.double_val)
    elseif entry.data_val or entry.string_val or entry.vec_val then
      ProtocolParser.writeUInt32(ms, bit.bor(bit.lshift(index, 3), 2))
    
      entry:serializeLengthDelimited(ms)
    end
  end
  
  --print("b", ms:getPosition())
  
  local buffer = ms:getBuffer()
  
  ProtocolParser.writeBytes(stream, buffer, ms:getPosition())

  PooledObjects.memoryStreamPool:push(ms)
  
  --print("c")
end

return RTDataSerializer