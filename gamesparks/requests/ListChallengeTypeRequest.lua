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

function ListChallengeTypeRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
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
