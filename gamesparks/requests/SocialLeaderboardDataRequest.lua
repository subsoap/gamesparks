local GSRequest = require("gamesparks.GSRequest")
local LeaderboardDataResponse = require("gamesparks.responses.LeaderboardDataResponse")

local SocialLeaderboardDataRequest = {}
local SocialLeaderboardDataRequest_mt = {__index = SocialLeaderboardDataRequest}

function SocialLeaderboardDataRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".SocialLeaderboardDataRequest"
  
  return setmetatable(instance, SocialLeaderboardDataRequest_mt)
end

setmetatable(SocialLeaderboardDataRequest, {__index = GSRequest})

function SocialLeaderboardDataRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function SocialLeaderboardDataRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(LeaderboardDataResponse.new(message))
    end
  end)
end

	
function SocialLeaderboardDataRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function SocialLeaderboardDataRequest:setChallengeInstanceId(challengeInstanceId)
	self:setAttribute("challengeInstanceId", challengeInstanceId)
end
	
	
	
function SocialLeaderboardDataRequest:setDontErrorOnNotSocial(dontErrorOnNotSocial)
	self:setAttribute("dontErrorOnNotSocial", dontErrorOnNotSocial)
end
	
	
	
function SocialLeaderboardDataRequest:setEntryCount(entryCount)
	self:setAttribute("entryCount", entryCount)
end
	
	
	
function SocialLeaderboardDataRequest:setFriendIds(friendIds)
	self:setAttribute("friendIds", friendIds)
end
	
	
	
function SocialLeaderboardDataRequest:setIncludeFirst(includeFirst)
	self:setAttribute("includeFirst", includeFirst)
end
	
	
	
function SocialLeaderboardDataRequest:setIncludeLast(includeLast)
	self:setAttribute("includeLast", includeLast)
end
	
	
	
function SocialLeaderboardDataRequest:setInverseSocial(inverseSocial)
	self:setAttribute("inverseSocial", inverseSocial)
end
	
	
	
function SocialLeaderboardDataRequest:setLeaderboardShortCode(leaderboardShortCode)
	self:setAttribute("leaderboardShortCode", leaderboardShortCode)
end
	
	
	
function SocialLeaderboardDataRequest:setOffset(offset)
	self:setAttribute("offset", offset)
end
	
	
	
function SocialLeaderboardDataRequest:setSocial(social)
	self:setAttribute("social", social)
end
	
	
	
function SocialLeaderboardDataRequest:setTeamIds(teamIds)
	self:setAttribute("teamIds", teamIds)
end
	
	
	
function SocialLeaderboardDataRequest:setTeamTypes(teamTypes)
	self:setAttribute("teamTypes", teamTypes)
end

return SocialLeaderboardDataRequest
