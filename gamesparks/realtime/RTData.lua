--GameSparksRT = GameSparksRT or require("gamesparks.realtime.GameSparksRT")
RTVal = RTVal or require("gamesparks.realtime.proto.RTVal")
RTDataSerializer = RTDataSerializer or require("gamesparks.realtime.proto.RTDataSerializer")

local RTData = {}
local RTData_mt = {__index = RTData}

RTDataSerializer.cache = ObjectPool.new(function()
  return RTData.new()
end, function(rtData)
  for i = 1, #rtData.data do
    if rtData.data[i].data_val ~= nil then
      rtData.data[i].data_val:dispose()
    end
    rtData.data[i]:reset()
  end
end, 5)

function RTData.new()
  local instance = {}

  instance.data = {}
  for i = 1, GameSparksRT.MAX_RTDATA_SLOTS do
    instance.data[i] = RTVal.new()
  end

  return setmetatable(instance, RTData_mt)
end

function RTData.get()
  return RTDataSerializer.cache:pop()
end

function RTData.readRTData(stream, instance)
  return RTDataSerializer.readRTData(stream, instance)
end

function RTData.writeRTData(stream, instance)
  RTDataSerializer.writeRTData(stream, instance)
end

function RTData:dispose()
  for i = 1, #self.data do
    if self.data[i]:dirty() then
      self.data[i] = RTVal.new()
    end
  end

  RTDataSerializer.cache:push(self)
end

function RTData:getRTVector(index)
  return self.data[index].vec_val
end

function RTData:getLong(index)
  return self.data[index].long_val
end

function RTData:getFloat(index)
  return self.data[index].float_val
end

function RTData:getDouble(index)
  return self.data[index].double_val
end

function RTData:getString(index)
  return self.data[index].string_val
end

function RTData:getData(index)
  return self.data[index].data_val
end

function RTData:setRTVector(index, value)
  self.data[index] = RTVal.newRTVector(value)
  
  return self
end

function RTData:setLong(index, value)
  self.data[index] = RTVal.newLong(value)
  
  return self
end

function RTData:setFloat(index, value)
  self.data[index] = RTVal.newFloat(value)
  
  return self
end

function RTData:setDouble(index, value)
  self.data[index] = RTVal.newDouble(value)
  
  return self
end

function RTData:setString(index, value)
  self.data[index] = RTVal.newString(value)
  
  return self
end

function RTData:setData(index, value)
  self.data[index] = RTVal.newRTData(value)
  
  return self
end

function RTData:toString()
  return self:asString()
end

function RTData:asString()
  local builder = " {"
  
  for i = 1, GameSparksRT.MAX_RTDATA_SLOTS do
    local val = self.data[i]:asString()
    
    if val ~= nil then
      builder = builder .. " [" .. i .. " " .. val .. "] "
    end
  end
  builder = builder .. "} "
  
  return builder
end

return RTData