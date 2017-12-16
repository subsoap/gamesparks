local Key = {}
local Key_mt = {__index = Key}

function Key.new(field, wireType)
  local instance = {}
  
  instance.field = field
  instance.wireType = wireType
  
  return setmetatable(instance, Key_mt)
end

function Key:toString()
  return "[Key: " .. self.field .. ", " .. self.wireType .. "]"
end

return Key
  