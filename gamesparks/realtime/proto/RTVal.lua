RTVector = RTVector or require("gamesparks.realtime.RTVector")

local RTVal = {}
local RTVal_mt = {__index = RTVal}

function RTVal.new()
  local instance = {}
  
  instance.long_val = nil
  instance.float_val = nil
  instance.double_val = nil
  instance.data_val = nil
  instance.string_val = nil
  instance.vec_val = nil
  
  return setmetatable(instance, RTVal_mt)
end

function RTVal.newLong(value)
  local instance = {}
  
  instance.long_val = value
  instance.float_val = nil
  instance.double_val = nil
  instance.data_val = nil
  instance.string_val = nil
  instance.vec_val = nil
  
  return setmetatable(instance, RTVal_mt)
end

function RTVal.newFloat(value)
  local instance = {}
  
  instance.long_val = nil
  instance.float_val = value
  instance.double_val = nil
  instance.data_val = nil
  instance.string_val = nil
  instance.vec_val = nil
  
  return setmetatable(instance, RTVal_mt)
end

function RTVal.newDouble(value)
  local instance = {}
  
  instance.long_val = nil
  instance.float_val = nil
  instance.double_val = value
  instance.data_val = nil
  instance.string_val = nil
  instance.vec_val = nil
  
  return setmetatable(instance, RTVal_mt)
end

function RTVal.newRTData(value)
  local instance = {}
  
  instance.long_val = nil
  instance.float_val = nil
  instance.double_val = nil
  instance.data_val = value
  instance.string_val = nil
  instance.vec_val = nil
  
  return setmetatable(instance, RTVal_mt)
end

function RTVal.newString(value)
  local instance = {}
  
  instance.long_val = nil
  instance.float_val = nil
  instance.double_val = nil
  instance.data_val = nil
  instance.string_val = value
  instance.vec_val = nil
  
  return setmetatable(instance, RTVal_mt)
end

function RTVal.newRTVector(value)
  local instance = {}
  
  instance.long_val = nil
  instance.float_val = nil
  instance.double_val = nil
  instance.data_val = nil
  instance.string_val = nil
  instance.vec_val = value
  
  return setmetatable(instance, RTVal_mt)
end

function RTVal.deserializeLengthDelimited(stream)
  local instance = RTVal.new()
  
  local limit = ProtocolParser.readUInt32(stream)
  
  limit = limit + stream:getPosition()
  
  while true do
    if stream:getPosition() >= limit then
      if stream:getPosition() == limit then
        break
      else
        print("WARNING: " .. "Read past max limit")
        
        break
      end
    end
    
    local keyByte = stream:readByte()
    
    if keyByte == -1 then
      print("WARNING: " .. "End of stream")
        
      break
    end
    
    local continue = false
    
    if keyByte == 10 then
      instance.string_val = ProtocolParser.readString(stream)
      
      continue = true
    elseif keyByte == 18 then
      local end2 = ProtocolParser.readUInt32(stream)
      
      end2 = end2 + stream:getPosition()
      
      local v = RTVector.new()
      
      local i = 0
      while stream:getPosition() < end2 do
        local read = ProtocolParser.readSingle(stream)
        
        if i == 0 then
          v.x = read
        elseif i == 1 then
          v.y = read
        elseif i == 2 then
          v.z = read
        elseif i == 3 then
          v.w = read
        end
        
        i = i + 1
      end
      instance.vec_val = v
     
      if stream:getPosition() ~= end2 then
        print("WARNING: " .. "Read too many bytes in packed data")
        
        break
      end
      
      continue = true
    elseif keyByte == 114 then
      if instance.data_val == nil then
        instance.data_val = RTDataSerializer.cache:pop()
      end
      RTData.readRTData(stream, instance.data_val)
      
      continue = true
    end
    
    if not continue then
      local key = ProtocolParser.readKey(keyByte, stream)
      
      if key.field == 0 then
        print("WARNING: " .. "Invalid field id: 0, something went wrong in the stream")
        
        break
      else
        if ProtocolParser.skipKey(stream, key) ~= true then
          break
        end
      end
    end
  end
    
  return instance
end

function RTVal:serializeLengthDelimited(stream)
  local ms = PooledObjects.memoryStreamPool:pop()
  
  --print("RTVal:serializeLengthDelimited", self.string_cal, self.data_val, self.vec_val)
    
  if self.string_val then
    ms:writeByte(10)
    ProtocolParser.writeString(ms, self.string_val)
  elseif self.data_val then 
    ms:writeByte(114)
    RTData.writeRTData(ms, self.data_val) 
  elseif self.vec_val then
    local vec_value = self.vec_val
    local numberOfFloatsSet = 0
    
    ms:writeByte(18)
    
    if vec_value.x then
      numberOfFloatsSet = numberOfFloatsSet + 1
    end
    if vec_value.y then
      numberOfFloatsSet = numberOfFloatsSet + 1
    end
    if vec_value.z then
      numberOfFloatsSet = numberOfFloatsSet + 1
    end
    if vec_value.w then
      numberOfFloatsSet = numberOfFloatsSet + 1
    end
    
    ProtocolParser.writeUInt32(ms, 4 * numberOfFloatsSet)

    for i = 1, numberOfFloatsSet do
      if i == 1 then
        ProtocolParser.writeSingle(ms, vec_value.x)
      elseif i == 2 then
        ProtocolParser.writeSingle(ms, vec_value.y)
      elseif i == 3 then
        ProtocolParser.writeSingle(ms, vec_value.z)
      elseif i == 4 then
        ProtocolParser.writeSingle(ms, vec_value.w)
      end
    end
  end
  
  local data = ms:getBuffer()
  
  ProtocolParser.writeBytes(stream, data, ms:getPosition())
  
  PooledObjects.memoryStreamPool:push(ms)
end

function RTVal:reset()
  if self.data_val ~= nil then
    self.data_val:dispose()
  end
  self.long_val = nil
  self.float_val = nil
  self.double_val = nil
  self.data_val = nil
  self.string_val = nil
  self.vec_val = nil
end

function RTVal:dirty()
  if self.long_val ~= nil then
    return true
  elseif self.float_val ~= nil then
    return true
  elseif self.double_val ~= nil then
    return true
  elseif self.data_val ~= nil then
    return true
  elseif self.string_val ~= nil then
    return true
  elseif self.vec_val ~= nil then
    return true
  end
  
  return false
end

function RTVal:asString()
  if self.long_val ~= nil then
    return tostring(self.long_val)
  elseif self.float_val ~= nil then
    return tostring(self.float_val)
  elseif self.double_val ~= nil then
    return tostring(self.double_val)
  elseif self.data_val ~= nil then
    return self.data_val:toString()
  elseif self.string_val ~= nil then
    return "\"" .. self.string_val .. "\""
  elseif self.vec_val ~= nil then
    return "|" .. tostring(self.vec_val.x) .. "|" .. tostring(self.vec_val.y) .. "|" .. tostring(self.vec_val.z) .. "|" .. tostring(self.vec_val.w) .. "|"
  end
  
  return nil
end

return RTVal
