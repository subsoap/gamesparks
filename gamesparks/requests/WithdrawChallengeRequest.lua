local GSRequest = require("gamesparks.GSRequest")
local WithdrawChallengeResponse = require("gamesparks.responses.WithdrawChallengeResponse")

local WithdrawChallengeRequest = {}
local WithdrawChallengeRequest_mt = {__index = WithdrawChallengeRequest}

function WithdrawChallengeRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".WithdrawChallengeRequest"
  
  return setmetatable(instance, WithdrawChallengeRequest_mt)
end

setmetatable(WithdrawChallengeRequest, {__index = GSRequest})

function WithdrawChallengeRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function WithdrawChallengeRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(WithdrawChallengeResponse.new(message))
    end
  end)
end

	
function WithdrawChallengeRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function WithdrawChallengeRequest:setChallengeInstanceId(challengeInstanceId)
	self:setAttribute("challengeInstanceId", challengeInstanceId)
end
	
	
	
function WithdrawChallengeRequest:setMessage(message)
	self:setAttribute("message", message)
end

return WithdrawChallengeRequest
