local GSRequest = require("gamesparks.GSRequest")
local FindChallengeResponse = require("gamesparks.responses.FindChallengeResponse")

local FindChallengeRequest = {}
local FindChallengeRequest_mt = {__index = FindChallengeRequest}

function FindChallengeRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".FindChallengeRequest"
  
  return setmetatable(instance, FindChallengeRequest_mt)
end

setmetatable(FindChallengeRequest, {__index = GSRequest})

function FindChallengeRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function FindChallengeRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(FindChallengeResponse.new(message))
    end
  end)
end

	
function FindChallengeRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function FindChallengeRequest:setAccessType(accessType)
	self:setAttribute("accessType", accessType)
end
	
	
	
function FindChallengeRequest:setCount(count)
	self:setAttribute("count", count)
end
	
	
	
function FindChallengeRequest:setEligibility(eligibility)
	self:setAttribute("eligibility", eligibility)
end
	
	
	
function FindChallengeRequest:setOffset(offset)
	self:setAttribute("offset", offset)
end
	
	
	
function FindChallengeRequest:setShortCode(shortCode)
	self:setAttribute("shortCode", shortCode)
end

return FindChallengeRequest
