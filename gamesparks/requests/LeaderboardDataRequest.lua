local GSRequest = require("gamesparks.GSRequest")
local LeaderboardDataResponse = require("gamesparks.responses.LeaderboardDataResponse")

local LeaderboardDataRequest = {}
local LeaderboardDataRequest_mt = {__index = LeaderboardDataRequest}

function LeaderboardDataRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".LeaderboardDataRequest"
  
  return setmetatable(instance, LeaderboardDataRequest_mt)
end

setmetatable(LeaderboardDataRequest, {__index = GSRequest})

function LeaderboardDataRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function LeaderboardDataRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(LeaderboardDataResponse.new(message))
    end
  end)
end

	
function LeaderboardDataRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function LeaderboardDataRequest:setChallengeInstanceId(challengeInstanceId)
	self:setAttribute("challengeInstanceId", challengeInstanceId)
end
	
	
	
function LeaderboardDataRequest:setDontErrorOnNotSocial(dontErrorOnNotSocial)
	self:setAttribute("dontErrorOnNotSocial", dontErrorOnNotSocial)
end
	
	
	
function LeaderboardDataRequest:setEntryCount(entryCount)
	self:setAttribute("entryCount", entryCount)
end
	
	
	
function LeaderboardDataRequest:setFriendIds(friendIds)
	self:setAttribute("friendIds", friendIds)
end
	
	
	
function LeaderboardDataRequest:setIncludeFirst(includeFirst)
	self:setAttribute("includeFirst", includeFirst)
end
	
	
	
function LeaderboardDataRequest:setIncludeLast(includeLast)
	self:setAttribute("includeLast", includeLast)
end
	
	
	
function LeaderboardDataRequest:setInverseSocial(inverseSocial)
	self:setAttribute("inverseSocial", inverseSocial)
end
	
	
	
function LeaderboardDataRequest:setLeaderboardShortCode(leaderboardShortCode)
	self:setAttribute("leaderboardShortCode", leaderboardShortCode)
end
	
	
	
function LeaderboardDataRequest:setOffset(offset)
	self:setAttribute("offset", offset)
end
	
	
	
function LeaderboardDataRequest:setSocial(social)
	self:setAttribute("social", social)
end
	
	
	
function LeaderboardDataRequest:setTeamIds(teamIds)
	self:setAttribute("teamIds", teamIds)
end
	
	
	
function LeaderboardDataRequest:setTeamTypes(teamTypes)
	self:setAttribute("teamTypes", teamTypes)
end

return LeaderboardDataRequest
