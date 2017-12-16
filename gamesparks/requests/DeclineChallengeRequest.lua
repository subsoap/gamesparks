local GSRequest = require("gamesparks.GSRequest")
local DeclineChallengeResponse = require("gamesparks.responses.DeclineChallengeResponse")

local DeclineChallengeRequest = {}
local DeclineChallengeRequest_mt = {__index = DeclineChallengeRequest}

function DeclineChallengeRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".DeclineChallengeRequest"
  
  return setmetatable(instance, DeclineChallengeRequest_mt)
end

setmetatable(DeclineChallengeRequest, {__index = GSRequest})

function DeclineChallengeRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function DeclineChallengeRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(DeclineChallengeResponse.new(message))
    end
  end)
end

	
function DeclineChallengeRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function DeclineChallengeRequest:setChallengeInstanceId(challengeInstanceId)
	self:setAttribute("challengeInstanceId", challengeInstanceId)
end
	
	
	
function DeclineChallengeRequest:setMessage(message)
	self:setAttribute("message", message)
end

return DeclineChallengeRequest
