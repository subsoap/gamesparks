local GSRequest = require("gamesparks.GSRequest")
local AroundMeLeaderboardResponse = require("gamesparks.responses.AroundMeLeaderboardResponse")

local AroundMeLeaderboardRequest = {}
local AroundMeLeaderboardRequest_mt = {__index = AroundMeLeaderboardRequest}

function AroundMeLeaderboardRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".AroundMeLeaderboardRequest"
  
  return setmetatable(instance, AroundMeLeaderboardRequest_mt)
end

setmetatable(AroundMeLeaderboardRequest, {__index = GSRequest})

function AroundMeLeaderboardRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function AroundMeLeaderboardRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AroundMeLeaderboardResponse.new(message))
    end
  end)
end

	
function AroundMeLeaderboardRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function AroundMeLeaderboardRequest:setChallengeInstanceId(challengeInstanceId)
	self:setAttribute("challengeInstanceId", challengeInstanceId)
end
	
	
	
function AroundMeLeaderboardRequest:setCustomIdFilter(customIdFilter)
	self:setAttribute("customIdFilter", customIdFilter)
end
	
	
	
function AroundMeLeaderboardRequest:setDontErrorOnNotSocial(dontErrorOnNotSocial)
	self:setAttribute("dontErrorOnNotSocial", dontErrorOnNotSocial)
end
	
	
	
function AroundMeLeaderboardRequest:setEntryCount(entryCount)
	self:setAttribute("entryCount", entryCount)
end
	
	
	
function AroundMeLeaderboardRequest:setFriendIds(friendIds)
	self:setAttribute("friendIds", friendIds)
end
	
	
	
function AroundMeLeaderboardRequest:setIncludeFirst(includeFirst)
	self:setAttribute("includeFirst", includeFirst)
end
	
	
	
function AroundMeLeaderboardRequest:setIncludeLast(includeLast)
	self:setAttribute("includeLast", includeLast)
end
	
	
	
function AroundMeLeaderboardRequest:setInverseSocial(inverseSocial)
	self:setAttribute("inverseSocial", inverseSocial)
end
	
	
	
function AroundMeLeaderboardRequest:setLeaderboardShortCode(leaderboardShortCode)
	self:setAttribute("leaderboardShortCode", leaderboardShortCode)
end
	
	
	
function AroundMeLeaderboardRequest:setSocial(social)
	self:setAttribute("social", social)
end
	
	
	
function AroundMeLeaderboardRequest:setTeamIds(teamIds)
	self:setAttribute("teamIds", teamIds)
end
	
	
	
function AroundMeLeaderboardRequest:setTeamTypes(teamTypes)
	self:setAttribute("teamTypes", teamTypes)
end

return AroundMeLeaderboardRequest
