local KeyValue = {}
local KeyValue_mt = {__index = KeyValue}

function KeyValue.new(key, value)
  local instance = {}
  
  instance.key = key
  instance.value = value
  
  return setmetatable(instance, KeyValue_mt)
end

function KeyValue:toString()
  return "[KeyValue: " .. self.key.field .. ", " .. self.key.wireType .. ", " .. #self.value .. " bytes]"
end

return KeyValue
  