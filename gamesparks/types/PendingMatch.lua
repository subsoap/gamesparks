
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")

local MatchedPlayer = require("gamesparks.types.MatchedPlayer")


local PendingMatch = {}
local PendingMatch_mt = {__index = PendingMatch}

function PendingMatch.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, PendingMatch_mt)
end

setmetatable(PendingMatch, {__index = GSData})

	
		
-- The ID for the pending match
-- method type 5 - primitive return type
function PendingMatch:getId()
	if self:getAttribute("id") ~= nil then
		return self:getAttribute("id")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of the matchData associated to this pending match
-- method type 5 - primitive return type
function PendingMatch:getMatchData()
	if self:getAttribute("matchData") ~= nil then
		return self:getAttribute("matchData")
  	end
	
  	return nil
  	
end
		
-- The match group for the pending match
-- method type 5 - primitive return type
function PendingMatch:getMatchGroup()
	if self:getAttribute("matchGroup") ~= nil then
		return self:getAttribute("matchGroup")
  	end
	
  	return nil
  	
end
		
-- The match shortCode for the pending match
-- method type 5 - primitive return type
function PendingMatch:getMatchShortCode()
	if self:getAttribute("matchShortCode") ~= nil then
		return self:getAttribute("matchShortCode")
  	end
	
  	return nil
  	
end
		
-- The players already part of this pending match
-- method type 1 - typed object array return type
function PendingMatch:getMatchedPlayers()
	local ret = {}
	local matchedPlayers = self:getAttribute("matchedPlayers")
	
	if matchedPlayers ~= nil then
		for a = 1, #matchedPlayers do
	    	ret[a] = MatchedPlayer.new(matchedPlayers[a])
	    end
	end
	  
	return ret
end
			
		
-- The average skill of players in this pending match
-- method type 5 - primitive return type
function PendingMatch:getSkill()
	if self:getAttribute("skill") ~= nil then
		return self:getAttribute("skill")
  	end
	
  	return math.nan
  	
end

return PendingMatch

