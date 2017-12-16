local GSRequest = require("gamesparks.GSRequest")
local JoinChallengeResponse = require("gamesparks.responses.JoinChallengeResponse")

local JoinChallengeRequest = {}
local JoinChallengeRequest_mt = {__index = JoinChallengeRequest}

function JoinChallengeRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".JoinChallengeRequest"
  
  return setmetatable(instance, JoinChallengeRequest_mt)
end

setmetatable(JoinChallengeRequest, {__index = GSRequest})

function JoinChallengeRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function JoinChallengeRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(JoinChallengeResponse.new(message))
    end
  end)
end

	
function JoinChallengeRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function JoinChallengeRequest:setChallengeInstanceId(challengeInstanceId)
	self:setAttribute("challengeInstanceId", challengeInstanceId)
end
	
	
	
function JoinChallengeRequest:setEligibility(eligibility)
	self:setAttribute("eligibility", eligibility)
end
	
	
	
function JoinChallengeRequest:setMessage(message)
	self:setAttribute("message", message)
end

return JoinChallengeRequest
