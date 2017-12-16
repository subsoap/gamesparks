local RTVector = {}
local RTVector_mt = {__index = RTVector}

function RTVector.new(x, y, z, w)
  local instance = {}
  
  instance.x = x
  instance.y = y
  instance.z = z
  instance.w = w
  
  return setmetatable(instance, RTVector_mt)
end

return RTVector