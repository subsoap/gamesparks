PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")

local ActionCommand = {}
local ActionCommand_mt = {__index = ActionCommand}

ActionCommand.pool = ObjectPool.new(function()
  return ActionCommand.new()
end, nil, 5)

function ActionCommand.new()
  local instance = {}
  
  instance.action = nil

  return setmetatable(instance, ActionCommand_mt)
end

function ActionCommand:configure(action)
  self.action = action

  return self
end

function ActionCommand:execute()
  self.action()
  ActionCommand.pool:push(self)
end

return ActionCommand