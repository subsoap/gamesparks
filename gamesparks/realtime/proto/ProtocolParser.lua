--local bit = require("plugin.bit")
Key = Key or require("gamesparks.realtime.proto.Key")
Wire = Wire or require("gamesparks.realtime.proto.Wire")
PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")
Stream = require("gamesparks.realtime.proto.Stream")

ProtocolParser = {}

function ProtocolParser.readBool(stream)
  local b = stream:readByte()
  
  if b < 0 then
    print("WARNING: " .. "Stream ended too early")
    
    return false
  elseif b == 1 then
    return true
  elseif b == 0 then
    return false
  end
  
  print("WARNING: " .. "Invalid boolean value")
  
  return false
end

function ProtocolParser.writeBool(stream, val)
  if val then
    return stream:writeByte(1)
  else
    return stream:writeByte(0)
  end
end

function ProtocolParser.readZInt32(stream)
  local val = ProtocolParser.readUInt32(stream)
  
  return bit.bxor(bit.arshift(val, 1), bit.arshift(bit.lshift(val, 31), 31))
end

function ProtocolParser.writeZInt32(stream, val)
  local val1 = bit.lshift(val, 1)
  local val2 = bit.arshift(val, 31)

  ProtocolParser.writeUInt32(stream, bit.bxor(val1, val2))
end

function ProtocolParser.readUInt32(stream)
  local b
  local val = 0

  for n = 0, 4 do
    b = stream:readByte()
    if b < 0 then
      print("WARNING: " .. "Stream ended too early")
      
      return 0
    end

    if (n == 4) and bit.band(b, 0xF0) ~= 0 then
      print("WARNING: " .. "Got larger VarInt than 32bit unsigned")
      
      return 0
    end

    if bit.band(b, 0x80) == 0 then
      return bit.bor(val, bit.lshift(b, 7 * n))
    end

    val = bit.bor(val, bit.lshift(bit.band(b, 0x7F), 7 * n))
  end

  print("WARNING: " .. "Got larger VarInt than 32bit unsigned")
  
  return 0
end

function ProtocolParser.writeUInt32(stream, val)
  local b
  
  val = math.abs(val)

  while true do
    b = bit.band(val, 0x7F)
    val = bit.rshift(val, 7)
    if val == 0 then
      stream:writeByte(b)
      
      break
    else
      b = bit.bor(b, 0x80)
     
      stream:writeByte(b)
    end
  end
end

function ProtocolParser.readSingle(stream)
  local b = {}
  local val = 0

  for n = 1, 4 do
    b[5 - n] = stream:readByte()
  end
  
  val = bit.bor(bit.bor(bit.lshift(b[1], 24), bit.lshift(b[2], 16)), bit.bor(bit.lshift(b[3], 8), b[4]))
  
  local negative = bit.band(b[1], 0x80) == 0x80
  local exponent = bit.arshift(bit.band(val, 0x7f800000), 23)    
  local sign
  
  if negative then
    sign = -1
  else
    sign = 1
  end
  
  exponent = exponent - 127
 
  local power = -1
  local total = 0.0
  
  for i = 0, 22 do
    local c = bit.rshift(bit.band(val, bit.lshift(1, 22 - i)), 22 - i)
    
    total = total + c * math.pow(2.0, power)
    power = power - 1
  end
  total = total + 1.0
 
  local value = sign * math.pow(2.0, exponent) * total
 
  return value
end

function ProtocolParser.writeSingle(stream, val)
  local bytes = {0, 0, 0, 0}
 
  if val ~= 0 then
    local anum = math.abs(val)
    local mantissa, exponent = math.frexp(anum)
    
    exponent = exponent - 1
    mantissa = mantissa * 2 - 1
   
    local sign = val ~= anum and 128 or 0
    
    exponent = exponent + 127

    bytes[1] = sign + math.floor(exponent / 2 ^ 1)
    mantissa = mantissa * 2 ^ 7
   
    local currentmantissa = math.floor(mantissa)
   
    mantissa = mantissa - currentmantissa
    bytes[2] = (exponent % 2 ^ 1) * 2 ^ 7 + currentmantissa
    for i = 3, 4 do
      mantissa = mantissa * 2 ^ 8
      currentmantissa = math.floor(mantissa)
      mantissa = mantissa - currentmantissa
      bytes[i] = currentmantissa
    end
  end
  
  for i = #bytes, 1, -1 do
    stream:writeByte(bytes[i])
  end
end

function ProtocolParser.readZInt64(stream)
  local val = ProtocolParser.readUInt64(stream)
  local sign = false
  
  --return bit.bxor(bit.arshift(val, 1), bit.arshift(bit.lshift(val, 63), 63))
  --[[if val > 1125899906842623 then
    return 1125899906842623 - val
  else
    return val
  end--]]
  
  if val % 2 == 1 then
    sign = true
  end
  
  val = math.floor(val / 2)
  
  if sign == true then
    return -val
  else
    return val
  end
end

function ProtocolParser.writeZInt64(stream, val)
  --ProtocolParser.writeUInt64(stream, bit.bxor(bit.lshift(val, 1), bit.arshift(val, 63)))
  --[[if val >= 0 then
    ProtocolParser.writeUInt64(stream, val)
  else
    ProtocolParser.writeUInt64(stream, math.abs(val) + 1125899906842623)
  end--]]
  local sign = false
  
  if val < 0 then 
    val = -val
    
    sign = true
  end
  
  val = val * 2
  
  if sign == true then
    val = val + 1
  end
  
  ProtocolParser.writeUInt64(stream, val)
end

function ProtocolParser.readUInt64(stream)
  local b
  local val = 0

  for n = 0, 9 do
    b = stream:readByte()
    if b < 0 then
      print("WARNING: " .. "Stream ended too early")
      
      return 0
    end
   
    if n == 9 and bit.band(b, 0xFE) ~= 0 then
      print("WARNING: " .. "Got larger VarInt than 64 bit unsigned")
      
      return 0
    end
    
    if bit.band(b, 0x80) == 0 then
      --return bit.bor(val, bit.lshift(b, 7 * n))
      return val + b * (128 ^ n)
    end

    --val = bit.bor(val, bit.lshift(bit.band(b, 0x7F), 7 * n))
    val = val + bit.band(b, 0x7F) * (128 ^ n)
  end

  print("WARNING: " .. "Got larger VarInt than 64 bit unsigned")
  
  return 0
end

function ProtocolParser.writeUInt64(stream, val)
  local b
  
  val = math.abs(val)
  
  while true do
    b = bit.band(val, 0x7F)
    --val = bit.rshift(val, 7)
    val = math.floor(val / 128)
    if val == 0 then
      stream:writeByte(b)
        
      break
    else
      b = bit.bor(b, 0x80)
        
      stream:writeByte(b)
    end
  end
end

function ProtocolParser.readDouble(stream)
  local b = {}
  local valh = 0
  local vall = 0

  for n = 1, 8 do
    b[9 - n] = stream:readByte()
  end
  
  valh = bit.bor(bit.bor(bit.lshift(b[1], 24), bit.lshift(b[2], 16)), bit.bor(bit.lshift(b[3], 8), b[4]))
  vall = bit.bor(bit.bor(bit.lshift(b[5], 24), bit.lshift(b[6], 16)), bit.bor(bit.lshift(b[7], 8), b[8]))
  
  local negative = bit.band(b[1], 0x80) == 0x80
  local exponent = bit.arshift(bit.band(valh, 0x7ff00000), 20)    
  local sign
  
  if negative then
    sign = -1
  else
    sign = 1
  end
  
  exponent = exponent - 1023
 
  local power = -1
  local total = 0.0
  
  for i = 0, 51 do
    local c
    
    if i < 20 then
      c = bit.rshift(bit.band(valh, bit.lshift(1, 19 - i)), 19 - i)
    else
      c = bit.rshift(bit.band(vall, bit.lshift(1, i - 20 + 31)), i - 20 + 31)
    end
    
    total = total + c * math.pow(2.0, power)
    power = power - 1
  end
  total = total + 1.0
 
  local value = sign * math.pow(2.0, exponent) * total
 
  return value
end

function ProtocolParser.writeDouble(stream, val)
  local bytes = {0, 0, 0, 0, 0, 0, 0, 0}
  
  if val ~= 0 then
    local anum = math.abs(val)
    local mantissa, exponent = math.frexp(anum)
    
    exponent = exponent - 1
    mantissa = mantissa * 2 - 1
   
    local sign = val ~= anum and 128 or 0
    
    exponent = exponent + 1023

    bytes[1] = sign + math.floor(exponent / 2 ^ 4)
    mantissa = mantissa * 2 ^ 4
   
    local currentmantissa = math.floor(mantissa)
   
    mantissa = mantissa - currentmantissa
    bytes[2] = (exponent % 2 ^ 4) * 2 ^ 4 + currentmantissa
    for i = 3, 8 do
      mantissa = mantissa * 2 ^ 8
      currentmantissa = math.floor(mantissa)
      mantissa = mantissa - currentmantissa
      bytes[i] = currentmantissa
    end
  end
  
  for i = #bytes, 1, -1 do
    stream:writeByte(bytes[i])
  end
end

function ProtocolParser.readSkipVarInt(stream)
  while true do
    local b = stream:readByte()
    
    if b < 0 then
        print("WARNING: " .. "Stream ended too early")
        
        return
    end

    if bit.band(b, 0x80) == 0 then
      return
    end
  end
end

function ProtocolParser.readString(stream)
  local length = ProtocolParser.readUInt32(stream)
  local ms = PooledObjects.memoryStreamPool:pop()
  local buffer = PooledObjects.byteBufferPool:pop()
  local read = 0
  local ret
  local r
  
  while read < length do
    r = stream:read(buffer, 0, math.min(length - read, #buffer))
    
    if r == 0 then
      print("WARNING: " .. "Expected " .. tostring(length - read) .. " got " .. read)
      
      return 0
    end
    ms:writeBytes(buffer, 0, r)
    read = read + r
  end
  
  ret = string.sub(ms:toString(), 1, ms:getPosition())
  
  PooledObjects.byteBufferPool:push(buffer)
  PooledObjects.memoryStreamPool:push(ms)
  
  return ret
end

function ProtocolParser.writeString(stream, val)
  local array = {}
  
  for i = 1, #val do
    array[i] = string.byte(string.sub(val, i, i))
  end
  
  ProtocolParser.writeBytes(stream, array, #val)
end

function ProtocolParser.writeBytes(stream, val, len)
  ProtocolParser.writeUInt32(stream, len)
  stream:writeBytes(val, 0, len)
end

function ProtocolParser.readKey(firstByte, stream)
  if firstByte < 128 then
    return Key.new(bit.rshift(firstByte, 3), bit.band(firstByte, 0x07))
  end
  
  local fieldID = bit.bor(bit.lshift(ProtocolParser.readUInt32(stream), 4), bit.band(bit.rshift(firstByte, 3), 0x0F))
  
  return Key.new(fieldID, bit.band(firstByte, 0x07))
end

function ProtocolParser.skipKey(stream, key)
  if key.wireType == Wire.FIXED32 then
    stream:seek(4)
  elseif key.wireType == Wire.FIXED64 then
    stream:seek(8)
  elseif key.wireType == Wire.LENGTH_DELIMITED then
    stream:seek(ProtocolParser.readUInt32(stream))
  elseif key.wireType == Wire.VARINT then
    ProtocolParser.readSkipVarInt(stream)
  else
    print("WARNING: " .. "Unknown wire type: " .. key.wireType)

    return false
  end

  return true
end

return ProtocolParser
