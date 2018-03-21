local Stream = {}
local Stream_mt = {__index = Stream}

function Stream.new()
  local instance = {}
  
  instance.buffer = ""
  instance.position = 0
  
  return setmetatable(instance, Stream_mt)
end

function Stream:getPosition()
  return self.position
end

function Stream:setPosition(position)
  self.position = position
end

function Stream:getLength()
  return #self.buffer
end

function Stream:bytesAvailable()
  return #self.buffer - self.position
end

function Stream:readByte()
  local ret = self:readChar()
  
  if type(ret) == "number" and ret == -1 then
    return 0
  else
    return string.byte(ret)
  end
end

function Stream:writeByte(byte)
  assert(type(byte) == "number", "not valid byte")
  assert(byte >= 0 and byte <= 255, "not valid byte")
  
  self:writeChar(string.char(byte))
end

function Stream:readChar()
  local buffer = ""
  local totalBytes
  
  totalBytes, buffer = self:readChars(buffer, self.position, 1)
  if totalBytes == 1 then
    return string.sub(buffer, 1, 1)
  else
    return -1
  end
end

function Stream:writeChar(char)
  self:writeChars(char, 0, 1)
end

function Stream:readChars(buffer, position, length)
  assert(type(buffer) == "string", "buffer must be string")
  
  if self:bytesAvailable() <= 0 then
    print("WARNING: " .. "Reached end of the stream")
   
    return 0, buffer
  end
  
  if length <= 0 then
    print("WARNING: " .. "no characters read (length = 0)")
    
    return 0, buffer
  end
  
  if #buffer > 0 then
    assert(position >= 0 and position < #buffer, "position out of range")
  else
    position = 0
  end
  
  local subString
  local newBuffer = ""
  local startPosition = self.position + 1
  local endPosition = startPosition + length - 1
  local newLength
  
  if endPosition > #self.buffer then
    endPosition = #self.buffer
  end
  
  newLength = endPosition - startPosition + 1
  
  subString = string.sub(self.buffer, startPosition, endPosition)
  
  self.position = endPosition
  
  if position == 0 then
    newBuffer = subString
    
    if #subString < #buffer then
      newBuffer = newBuffer .. string.sub(buffer, newLength + 1)
    end
  else
    newBuffer = string.sub(buffer, 1, position) .. subString
    
    if position + newLength + 1 <= #buffer then
      newBuffer = newBuffer .. string.sub(buffer, position + newLength + 1)
    end
  end
  
  return newLength, newBuffer
end

function Stream:writeChars(buffer, position, length)
  assert(type(buffer) == "string", "buffer must be string")
  
  assert(buffer ~= nil and #buffer > 0, "buffer must not be nil or empty")
  
  if self:bytesAvailable() < 0 then
    print("WARNING: " .. "Reached end of the stream")
    
    return
  end
  
  if length <= 0 then
    print("WARNING: " .. "no characters written (length = 0)")
    
    return 0, buffer
  end
  
  assert(position >= 0 and position < #buffer, "position out of range")
  
  local subString
  local newBuffer = ""
  local startPosition = position + 1
  local endPosition = startPosition + length - 1
  local newLength
  
  if endPosition > #buffer then
    endPosition = #buffer
  end
  
  newLength = endPosition - startPosition + 1
  
  subString = string.sub(buffer, startPosition, endPosition)
  
  if self.position == 0 then
    newBuffer = subString
    if #self.buffer > #subString then
      newBuffer = newBuffer .. string.sub(self.buffer, newLength + 1)
    end
  else
    newBuffer = string.sub(self.buffer, 1, self.position) .. subString
    
    if self.position + newLength + 1 <= #self.buffer then
      newBuffer = newBuffer .. string.sub(self.buffer, self.position + newLength + 1)
    end
  end
  
  self.buffer = newBuffer
  self.position = self.position + newLength
end

function Stream:read(buffer, position, length)
  assert(type(buffer) == "table", "buffer must be table")
  
  local totalBytes
  local newBuffer = string.char(unpack(buffer))
 
  totalBytes, newBuffer = self:readChars(newBuffer, position, length)
 
  for i = 1, #buffer do
    buffer[i] = nil
  end
 
  for i = 1, #newBuffer do
    buffer[i] = string.byte(string.sub(newBuffer, i, i))
  end
  
  return totalBytes
end

function Stream:writeBytes(buffer, position, length)
  assert(type(buffer) == "table", "buffer must be table")
  
  --print("first", #buffer, position, length)
  
  local newBuffer = ""
  
  for i = position + 1, position + length do
    newBuffer = newBuffer .. string.char(buffer[i])
  end
  
  --print("second", #newBuffer)
  
  --local newBuffer = string.char(unpack(buffer))
  
  self:writeChars(newBuffer, 0, length)
end

function Stream:seek(offset)
  self.position = self.position - offset
  
  if self.position < 0 then
    self.position = 0
  elseif self.position > #self.buffer then
    self.position = #self.buffer
  end
end

function Stream:toHex()
  for i = 1, math.ceil(#self.buffer / 16) * 16 do
    if (i - 1) % 16 == 0 then 
      io.write(string.format("%08X  ", i - 1)) 
    end
    io.write(i > #self.buffer and "   " or string.format("%02X ", self.buffer:byte(i)))
    if i %  8 == 0 then 
      io.write(' ') 
    end
    if i % 16 == 0 then 
      io.write(self.buffer:sub(i - 16 + 1, i):gsub("[^\x20-\x7E]", '.'), '\n') 
    end
  end
end

function Stream:toString()
  return self.buffer
end

function Stream:getBuffer()
  local buffer = {}
  
  for i = 1, #self.buffer do
    buffer[i] = string.byte(string.sub(self.buffer, i, i))
  end
  
  return buffer
end

return Stream
