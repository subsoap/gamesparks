local GSRequest = require("gamesparks.GSRequest")
local LogChallengeEventResponse = require("gamesparks.responses.LogChallengeEventResponse")

local LogChallengeEventRequest = {}
local LogChallengeEventRequest_mt = {__index = LogChallengeEventRequest}

function LogChallengeEventRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".LogChallengeEventRequest"
  
  return setmetatable(instance, LogChallengeEventRequest_mt)
end

setmetatable(LogChallengeEventRequest, {__index = GSRequest})

function LogChallengeEventRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function LogChallengeEventRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(LogChallengeEventResponse.new(message))
    end
  end)
end

		
function LogChallengeEventRequest:setEventAttribute(key, value)
	self:setAttribute(key, value)
end
		
	
	
	
function LogChallengeEventRequest:setChallengeInstanceId(challengeInstanceId)
	self:setAttribute("challengeInstanceId", challengeInstanceId)
end
	
	
	
function LogChallengeEventRequest:setEventKey(eventKey)
	self:setAttribute("eventKey", eventKey)
end

return LogChallengeEventRequest
