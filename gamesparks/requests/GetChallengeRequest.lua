local GSRequest = require("gamesparks.GSRequest")
local GetChallengeResponse = require("gamesparks.responses.GetChallengeResponse")

local GetChallengeRequest = {}
local GetChallengeRequest_mt = {__index = GetChallengeRequest}

function GetChallengeRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".GetChallengeRequest"
  
  return setmetatable(instance, GetChallengeRequest_mt)
end

setmetatable(GetChallengeRequest, {__index = GSRequest})

function GetChallengeRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function GetChallengeRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(GetChallengeResponse.new(message))
    end
  end)
end

	
function GetChallengeRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function GetChallengeRequest:setChallengeInstanceId(challengeInstanceId)
	self:setAttribute("challengeInstanceId", challengeInstanceId)
end
	
	
	
function GetChallengeRequest:setMessage(message)
	self:setAttribute("message", message)
end

return GetChallengeRequest
