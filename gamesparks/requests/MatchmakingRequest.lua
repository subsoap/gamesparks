local GSRequest = require("gamesparks.GSRequest")
local MatchmakingResponse = require("gamesparks.responses.MatchmakingResponse")

local MatchmakingRequest = {}
local MatchmakingRequest_mt = {__index = MatchmakingRequest}

function MatchmakingRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".MatchmakingRequest"
  
  return setmetatable(instance, MatchmakingRequest_mt)
end

setmetatable(MatchmakingRequest, {__index = GSRequest})

function MatchmakingRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function MatchmakingRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(MatchmakingResponse.new(message))
    end
  end)
end

	
function MatchmakingRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function MatchmakingRequest:setAction(action)
	self:setAttribute("action", action)
end
	
	
	
function MatchmakingRequest:setCustomQuery(customQuery)
	self:setAttribute("customQuery", customQuery)
end
	
	
	
function MatchmakingRequest:setMatchData(matchData)
	self:setAttribute("matchData", matchData)
end
	
	
	
function MatchmakingRequest:setMatchGroup(matchGroup)
	self:setAttribute("matchGroup", matchGroup)
end
	
	
	
function MatchmakingRequest:setMatchShortCode(matchShortCode)
	self:setAttribute("matchShortCode", matchShortCode)
end
	
	
	
function MatchmakingRequest:setParticipantData(participantData)
	self:setAttribute("participantData", participantData)
end
	
	
	
function MatchmakingRequest:setSkill(skill)
	self:setAttribute("skill", skill)
end

return MatchmakingRequest
