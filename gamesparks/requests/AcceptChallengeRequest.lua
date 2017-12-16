local GSRequest = require("gamesparks.GSRequest")
local AcceptChallengeResponse = require("gamesparks.responses.AcceptChallengeResponse")

local AcceptChallengeRequest = {}
local AcceptChallengeRequest_mt = {__index = AcceptChallengeRequest}

function AcceptChallengeRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".AcceptChallengeRequest"
  
  return setmetatable(instance, AcceptChallengeRequest_mt)
end

setmetatable(AcceptChallengeRequest, {__index = GSRequest})

function AcceptChallengeRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function AcceptChallengeRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AcceptChallengeResponse.new(message))
    end
  end)
end

	
function AcceptChallengeRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function AcceptChallengeRequest:setChallengeInstanceId(challengeInstanceId)
	self:setAttribute("challengeInstanceId", challengeInstanceId)
end
	
	
	
function AcceptChallengeRequest:setMessage(message)
	self:setAttribute("message", message)
end

return AcceptChallengeRequest
