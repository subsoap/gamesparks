CustomCommand = CustomCommand or require("gamesparks.realtime.commands.CustomCommand")

local Connection = {}
local Connection_mt = {__index = Connection}

function Connection.new(session)
  local instance = {}
  
  instance.session = session
  instance.stopped = false
  
  return setmetatable(instance, Connection_mt)
end

function Connection:stop()
  self.stopped = true
  self:stopInternal()
end

function Connection:onPacketReceived(p, packetSize)
  if p.command ~= nil then
    if p.command["abstractResultType"] then
      local result = p.command
      
      result:configure(p, self.session)
      if result:executeAsync() then
        self.session:submitAction(p.command)
      else
        p.command:execute()
      end
    else
      self.session:submitAction(p.command)
    end
  else
    if not p.hasPayload then
      local cmd
      
      if p.sender ~= nil then
        cmd = CustomCommand.pool:pop():configure(p.opCode, p.sender, nil, p.data, 0, self.session, packetSize)
      else
        cmd = CustomCommand.pool:pop():configure(p.opCode, 0, nil, p.data, 0, self.session, packetSize)
      end
      
      if cmd ~= nil then
        self.session:submitAction(cmd)
      end
    end
  end
end

return Connection