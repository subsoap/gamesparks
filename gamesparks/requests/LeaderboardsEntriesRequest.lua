local GSRequest = require("gamesparks.GSRequest")
local LeaderboardsEntriesResponse = require("gamesparks.responses.LeaderboardsEntriesResponse")

local LeaderboardsEntriesRequest = {}
local LeaderboardsEntriesRequest_mt = {__index = LeaderboardsEntriesRequest}

function LeaderboardsEntriesRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".LeaderboardsEntriesRequest"
  
  return setmetatable(instance, LeaderboardsEntriesRequest_mt)
end

setmetatable(LeaderboardsEntriesRequest, {__index = GSRequest})

function LeaderboardsEntriesRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function LeaderboardsEntriesRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(LeaderboardsEntriesResponse.new(message))
    end
  end)
end

	
function LeaderboardsEntriesRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function LeaderboardsEntriesRequest:setChallenges(challenges)
	self:setAttribute("challenges", challenges)
end
	
	
	
function LeaderboardsEntriesRequest:setInverseSocial(inverseSocial)
	self:setAttribute("inverseSocial", inverseSocial)
end
	
	
	
function LeaderboardsEntriesRequest:setLeaderboards(leaderboards)
	self:setAttribute("leaderboards", leaderboards)
end
	
	
	
function LeaderboardsEntriesRequest:setPlayer(player)
	self:setAttribute("player", player)
end
	
	
	
function LeaderboardsEntriesRequest:setSocial(social)
	self:setAttribute("social", social)
end
	
	
	
function LeaderboardsEntriesRequest:setTeamTypes(teamTypes)
	self:setAttribute("teamTypes", teamTypes)
end

return LeaderboardsEntriesRequest
