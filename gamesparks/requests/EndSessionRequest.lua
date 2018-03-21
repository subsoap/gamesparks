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

function EndSessionRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
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
