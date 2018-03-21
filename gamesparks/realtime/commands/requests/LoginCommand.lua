RTRequest = RTRequest or require("gamesparks.realtime.commands.requests.RTRequest")

local LoginCommand = {}
local LoginCommand_mt = {__index = LoginCommand}

function LoginCommand.new(token)
  local instance = RTRequest.new()
  
  instance.opCode = 0
  instance.token = token
  instance.clientVersion = 2

  return setmetatable(instance, LoginCommand_mt)
end

setmetatable(LoginCommand, {__index = RTRequest})

function LoginCommand:toPacket(session, fast)
  local p = PooledObjects.packetPool:pop()
  
  p.opCode = self.opCode
  p.data = self.data
  p.session = session

  if not fast and self.intent ~= GameSparksRT.deliveryIntent.RELIABLE then
    p.reliable = false
  end

  if self.intent == GameSparksRT.deliveryIntent.UNRELIABLE_SEQUENCED then
    p.sequenceNumber = session:nextSequenceNumber()
  end

  if #self.targetPlayers > 0 then
    p.targetPlayers = self.targetPlayers
  end

  p.request = self
  
  return p
end

function LoginCommand:serialize(stream)
  if self.token ~= nil then
    stream:writeByte(10)
    ProtocolParser.writeString(stream, self.token)
  end
  if self.clientVersion ~= nil then
    stream:writeByte(16)
    ProtocolParser.writeUInt64(stream, self.clientVersion)
  end
end

return LoginCommand
