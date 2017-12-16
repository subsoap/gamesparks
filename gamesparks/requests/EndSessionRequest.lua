local GSRequest = require("gamesparks.GSRequest")
local EndSessionResponse = require("gamesparks.responses.EndSessionResponse")

local EndSessionRequest = {}
local EndSessionRequest_mt = {__index = EndSessionRequest}

function EndSessionRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".EndSessionRequest"
  
  return setmetatable(instance, EndSessionRequest_mt)
end

setmetatable(EndSessionRequest, {__index = GSRequest})

function EndSessionRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function EndSessionRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(EndSessionResponse.new(message))
    end
  end)
end

	
function EndSessionRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	

return EndSessionRequest
