local GSRequest = require("gamesparks.GSRequest")
local GetLeaderboardEntriesResponse = require("gamesparks.responses.GetLeaderboardEntriesResponse")

local GetLeaderboardEntriesRequest = {}
local GetLeaderboardEntriesRequest_mt = {__index = GetLeaderboardEntriesRequest}

function GetLeaderboardEntriesRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".GetLeaderboardEntriesRequest"
  
  return setmetatable(instance, GetLeaderboardEntriesRequest_mt)
end

setmetatable(GetLeaderboardEntriesRequest, {__index = GSRequest})

function GetLeaderboardEntriesRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function GetLeaderboardEntriesRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(GetLeaderboardEntriesResponse.new(message))
    end
  end)
end

	
function GetLeaderboardEntriesRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function GetLeaderboardEntriesRequest:setChallenges(challenges)
	self:setAttribute("challenges", challenges)
end
	
	
	
function GetLeaderboardEntriesRequest:setInverseSocial(inverseSocial)
	self:setAttribute("inverseSocial", inverseSocial)
end
	
	
	
function GetLeaderboardEntriesRequest:setLeaderboards(leaderboards)
	self:setAttribute("leaderboards", leaderboards)
end
	
	
	
function GetLeaderboardEntriesRequest:setPlayer(player)
	self:setAttribute("player", player)
end
	
	
	
function GetLeaderboardEntriesRequest:setSocial(social)
	self:setAttribute("social", social)
end
	
	
	
function GetLeaderboardEntriesRequest:setTeamTypes(teamTypes)
	self:setAttribute("teamTypes", teamTypes)
end

return GetLeaderboardEntriesRequest
