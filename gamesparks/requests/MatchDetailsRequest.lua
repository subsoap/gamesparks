local GSRequest = require("gamesparks.GSRequest")
local MatchDetailsResponse = require("gamesparks.responses.MatchDetailsResponse")

local MatchDetailsRequest = {}
local MatchDetailsRequest_mt = {__index = MatchDetailsRequest}

function MatchDetailsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".MatchDetailsRequest"
  
  return setmetatable(instance, MatchDetailsRequest_mt)
end

setmetatable(MatchDetailsRequest, {__index = GSRequest})

function MatchDetailsRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function MatchDetailsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(MatchDetailsResponse.new(message))
    end
  end)
end

	
function MatchDetailsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function MatchDetailsRequest:setMatchId(matchId)
	self:setAttribute("matchId", matchId)
end
	
	
	
function MatchDetailsRequest:setRealtimeEnabled(realtimeEnabled)
	self:setAttribute("realtimeEnabled", realtimeEnabled)
end

return MatchDetailsRequest
