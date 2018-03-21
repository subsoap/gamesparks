local GSRequest = require("gamesparks.GSRequest")
local ListChallengeTypeResponse = require("gamesparks.responses.ListChallengeTypeResponse")

local ListChallengeTypeRequest = {}
local ListChallengeTypeRequest_mt = {__index = ListChallengeTypeRequest}

function ListChallengeTypeRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ListChallengeTypeRequest"
  
  return setmetatable(instance, ListChallengeTypeRequest_mt)
end

setmetatable(ListChallengeTypeRequest, {__index = GSRequest})

function ListChallengeTypeRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function ListChallengeTypeRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ListChallengeTypeResponse.new(message))
    end
  end)
end

	
function ListChallengeTypeRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	

return ListChallengeTypeRequest
