local AbstractResult = {}
local AbstractResult_mt = {__index = AbstractResult}

function AbstractResult.new()
  local instance = {}
  
  instance["abstractResultType"] = true
  instance.packet = nil
  instance.session = nil
  
  return setmetatable(instance, AbstractResult_mt)
end

function AbstractResult:configure(packet, session)
  self.packet = packet
  self.session = session
end

function AbstractResult:executeAsync()
  return true
end

return AbstractResult