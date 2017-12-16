local GSData = {}
local GSData_mt = {__index = GSData}

function GSData.new(d)
  local instance = {data = d}
  
  return setmetatable(instance, GSData_mt)
end

function GSData:getAttribute(name)
  return self.data[name]
end
  
function GSData:setAttribute(name, value)
  self.data[name] = value
end

return GSData