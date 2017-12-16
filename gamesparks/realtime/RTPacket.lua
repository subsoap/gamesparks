local RTPacket = {}
local RTPacket_mt = {__index = RTPacket}

function RTPacket.new(opCode, sender, limitedStream, limit, data, packetSize)
  local instance = {}

  instance.opCode = opCode
  instance.sender = sender
  instance.stream = limitedStream
  instance.streamLength = limit
  instance.data = data
  instance.packetSize = packetSize

  return setmetatable(instance, RTPacket_mt)
end

function RTPacket:toString()
  local string = "OpCode=" .. self.opCode .. ",Sender=" .. self.sender .. ",streamExists="
  
  if self.stream ~= nil then
    string = string .. "true,StreamLength=" .. self.streamLength
  else
    string = string .. "false"
  end
  
  string = string .. ",Data="
  
  if self.data ~= nil then
    string = string .. self.data:toString()
  else
    string = string .. ".PacketSize=" .. self.packetSize
  end
  
  return string
end

return RTPacket