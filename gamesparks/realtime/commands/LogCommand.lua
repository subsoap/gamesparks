PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")
--GameSparsRT = GameSparsRT or require("gamesparks.realtime.GameSparksRT")

local LogCommand = {}
local LogCommand_mt = {__index = LogCommand}

LogCommand.pool = ObjectPool.new(function()
  return LogCommand.new()
end, nil, 5)

function LogCommand.new()
  local instance = {}
  
  instance.tag = nil
  instance.msg = nil
  instance.level = nil
  instance.session = nil

  return setmetatable(instance, LogCommand_mt)
end

function LogCommand:configure(session, tag, level, msg)
  self.tag = tag
  self.msg = msg
  self.level = level
  self.session = session

  return self
end

function LogCommand:execute()
  if GameSparksRT.shouldLog(self.tag, self.level) then
    if self.session.peerId then
      GameSparksRT.logger(self.session.peerId .. " " .. self.tag .. ":" .. self.msg)
    else
      GameSparksRT.logger(" " .. self.tag .. ":" .. self.msg)
    end
  end
  
  LogCommand.pool:push(self)
end

return LogCommand