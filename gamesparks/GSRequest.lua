local GSData = require("gamesparks.GSData")

local GSRequest = {}
local GSRequest_mt = {__index = GSRequest}

function GSRequest.new(globalGS, data)
  if data == nil then
    data = {}
  end
  
  local instance = GSData.new(data)
  
  instance.gs = globalGS
    
  instance.timeoutSeconds = 5
  instance.callback = nil
  instance.requestId = nil
  instance.durable = false
  instance.durableRetryTicks = 0
  
  return setmetatable(instance, GSRequest_mt)
end

setmetatable(GSRequest, {__index = GSData})

local function copy(obj, seen)
  if type(obj) ~= 'table' then
    return obj 
  end
  if seen and seen[obj] then 
    return seen[obj] 
  end

  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  
  s[obj] = res
  
  for k, v in pairs(obj) do 
    res[copy(k, s)] = copy(v, s)
  end
  
  return res
end
  
local function deepCopy(request)
  local newRequest = GSRequest.new(request.gs)
  
  newRequest.data = copy(request:getData())
  
  newRequest.timeoutSeconds = request.timeoutSeconds
  newRequest.callback = request.callback
  newRequest.durable = request.durable
  
  return newRequest
end

function GSRequest:getData()
  return self.data
end

function GSRequest:send(callback)
  self.callback = callback
    
  local newRequest = deepCopy(self)
  
  self.gs.send(newRequest)
    
  return newRequest:getData().requestId
end
  
function GSRequest:hasCallback()
  if self.callback ~= nil then
    return true
  else
    return false
  end
end
  
function GSRequest:setCallback(callback)
  self.callback = callback
end
  
function GSRequest:setDurable(durable)
  self.durable = durable
end
  
function GSRequest:getTimeoutSeconds()
  return self.timeoutSeconds
end

return GSRequest
