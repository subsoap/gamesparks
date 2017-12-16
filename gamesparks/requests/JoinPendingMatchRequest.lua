local GSRequest = require("gamesparks.GSRequest")
local JoinPendingMatchResponse = require("gamesparks.responses.JoinPendingMatchResponse")

local JoinPendingMatchRequest = {}
local JoinPendingMatchRequest_mt = {__index = JoinPendingMatchRequest}

function JoinPendingMatchRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".JoinPendingMatchRequest"
  
  return setmetatable(instance, JoinPendingMatchRequest_mt)
end

setmetatable(JoinPendingMatchRequest, {__index = GSRequest})

function JoinPendingMatchRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function JoinPendingMatchRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(JoinPendingMatchResponse.new(message))
    end
  end)
end

	
function JoinPendingMatchRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function JoinPendingMatchRequest:setMatchGroup(matchGroup)
	self:setAttribute("matchGroup", matchGroup)
end
	
	
	
function JoinPendingMatchRequest:setMatchShortCode(matchShortCode)
	self:setAttribute("matchShortCode", matchShortCode)
end
	
	
	
function JoinPendingMatchRequest:setPendingMatchId(pendingMatchId)
	self:setAttribute("pendingMatchId", pendingMatchId)
end

return JoinPendingMatchRequest
