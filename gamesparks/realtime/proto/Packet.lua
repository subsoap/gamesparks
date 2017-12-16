ProtocolParser = ProtocolParser or require("gamesparks.realtime.proto.ProtocolParser")
CommandFactory = CommandFactory or require("gamesparks.realtime.commands.CommandFactory")
PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")
RTData = RTData or require("gamesparks.realtime.RTData")

local Packet = {}
local Packet_mt = {__index = Packet}

PooledObjects.packetPool = ObjectPool.new(function()
  return Packet.new()
end, function(packet)
  packet:reset()
end, 5)

function Packet.new()
  local instance = {}
  
  instance.opCode = 0
  instance.sequenceNumber = nil
  instance.requestId = nil
  instance.targetPlayers = nil
  instance.sender = nil
  instance.reliable = nil
  instance.data = nil
  instance.payload = nil
  instance.request = nil
  instance.hasPayload = false
  instance.command = nil
  instance.session = nil
  
  return setmetatable(instance, Packet_mt)
end

function Packet:reset()
  self.opCode = 0
  self.sequenceNumber = nil
  self.requestId = nil
  self.targetPlayers = nil
  self.sender = nil
  self.reliable = nil
  self.payload = nil
  self.command = nil
  self.request = nil
  self.hasPayload = false
  self.data = nil
end

function Packet:toString()
  return "{OpCode:" .. self.opCode .. ",TargetPlayers:" .. self:targetToString() .. "}"
end

function Packet:targetToString()
  local s = "["

  if self.targetPlayers ~= nil then
    for i = 1, #self.targetPlayers do 
      s = s .. self.targetPlayers[i] .. " "
    end
  end

  return s .. "]"
end

function Packet:readPayload(stream, packetSize)
  self.hasPayload = true
  if self.sender ~= nil then
    self.command = CommandFactory.getCommand(self.opCode, self.sender, self.sequenceNumber, stream, self.session, self.data, packetSize)
  else
    self.command = CommandFactory.getCommand(self.opCode, 0, self.sequenceNumber, stream, self.session, self.data, packetSize)
  end
  
  return nil
end

function Packet:writePayload(stream)
  if self.request ~= nil then
    local ms = PooledObjects.memoryStreamPool:pop()
   
    self.request:serialize(ms)
    
    local written = ms:getBuffer()

    if ms:getPosition() > 0 then
      stream:writeByte(122)
      ProtocolParser.writeBytes(stream, written, ms:getPosition())
    end
    
    PooledObjects.memoryStreamPool:push(ms)
  else
    if self.payload ~= nil then
      stream:writeByte(122)
      ProtocolParser.writeBytes(stream, self.payload, #self.payload)
    end
  end
end

function Packet.serialize(stream, instance)
  stream:writeByte(8)
  ProtocolParser.writeZInt32(stream, instance.opCode)
  
  --print("serialize", instance.opCode)
  
  --print("AAA", stream:getPosition())
  
  if instance.sequenceNumber ~= nil then
    stream:writeByte(16)
    ProtocolParser.writeUInt64(stream, instance.sequenceNumber)
  end
  
  --print("BBB", stream:getPosition())
  
  if instance.requestId ~= nil then
    stream:writeByte(24)
    ProtocolParser.writeUInt64(stream, instance.requestId)
  end
  
  --print("CCC", stream:getPosition())
  
  if instance.targetPlayers ~= nil then
    for i = 1, #instance.targetPlayers do
      stream:writeByte(32)
      ProtocolParser.writeUInt64(stream, instance.targetPlayers[i])
    end
  end
  
  --print("DDD", stream:getPosition())
  
  if instance.sender ~= nil then
    stream:writeByte(40)
    ProtocolParser.writeUInt64(stream, instance.sender)
  end
  
  --print("EEE", stream:getPosition())
  
  if instance.reliable ~= nil then
    stream:writeByte(48)
    ProtocolParser.writeBool(stream, instance.reliable)
  end
  
  --print("FFF", stream:getPosition())
  
  if instance.data ~= nil then
    stream:writeByte(114)
    RTData.writeRTData(stream, instance.data) 
  end
  
  --print("GGG", stream:getPosition())
            
  instance:writePayload(stream)
  
  --print("HHH", stream:getPosition())
  
  return stream
end

function Packet.serializeLengthDelimited(stream, instance)
  local ms = PooledObjects.memoryStreamPool:pop()
  local ret
  
  --print("pos1", ms:getPosition())
  
  Packet.serialize(ms, instance)
  
  --print("pos2", ms:getPosition())
  
  local data = ms:getBuffer()
  
  ProtocolParser.writeBytes(stream, data, ms:getPosition())
  
  --print(stream:getLength())
  --print(stream:toHex())
  
  ret = ms:getPosition()
  
  PooledObjects.memoryStreamPool:push(ms)
  
  return ret
end

function Packet.deserializeLengthDelimited(stream, instance)
  local limit = ProtocolParser.readUInt32(stream)
  local origLimit = limit
  
  limit = limit + stream:getPosition()
  
  while true do
    --print(stream:getPosition(), limit)
    if stream:getPosition() >= limit then
      if stream:getPosition() == limit then
        break
      else
        print("WARNING: " .. "Read past max limit")
        
        return 0
      end
    end
    
    local keyByte = stream:readByte()
    --print(keyByte,stream:getPosition())
    
    if keyByte == -1 then
      print("WARNING: " .. "End of stream")
        
      return 0
    end
    
    local continue = false
    
    if keyByte == 8 then
      instance.opCode = ProtocolParser.readZInt32(stream)
     
      continue = true
    elseif keyByte == 16 then
      instance.sequenceNumber = ProtocolParser.readUInt64(stream)
      
      continue = true
    elseif keyByte == 24 then
      instance.requestId = ProtocolParser.readUInt64(stream)
      
      continue = true
    elseif keyByte == 40 then
      instance.sender = ProtocolParser.readUInt64(stream)
      
      continue = true
    elseif keyByte == 48 then
      instance.reliable = ProtocolParser.readBool(stream)
      
      continue = true
    elseif keyByte == 114 then
      --PooledObjects.positionStreamPool:pop()
      if instance.data == nil then
        instance.data = RTData.readRTData(stream, instance.data)
      else
        RTData.readRTData(stream, instance.data)
      end
      
      continue = true
    elseif keyByte == 122 then
      instance.payload = instance:readPayload(stream, origLimit)
      
      continue = true
    end
    
    if not continue then
      local key = ProtocolParser.readKey(keyByte, stream)
      if key.field == 0 then
        print("WARNING: " .. "Invalid field id: 0, something went wrong in the stream")
        
        return 0
      else
        ProtocolParser.skipKey(stream, key)
      end
    end
  end
  
  return origLimit
end

return Packet