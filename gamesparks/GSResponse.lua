local GSData = require("gamesparks.GSData")

local GSResponse = {}
local GSResponse_mt = {__index = GSResponse}

function GSResponse.new(data)
  local instance = GSData.new(data)
  
  return setmetatable(instance, GSResponse_mt)
end

setmetatable(GSResponse, {__index = GSData})

function GSResponse:hasErrors()
  return self:getAttribute("error") ~= nil
end
  
function GSResponse:getScriptData()
  return self:getAttribute("scriptData")
end
  
function GSResponse:getErrors()
  return self:getAttribute("error")
end

return GSResponse

