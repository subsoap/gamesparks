
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local MatchedPlayer = {}
local MatchedPlayer_mt = {__index = MatchedPlayer}

function MatchedPlayer.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, MatchedPlayer_mt)
end

setmetatable(MatchedPlayer, {__index = GSData})

	
		
-- The Location of the player
-- method type 5 - primitive return type
function MatchedPlayer:getLocation()
	if self:getAttribute("location") ~= nil then
		return self:getAttribute("location")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data that was associated to this user
-- method type 5 - primitive return type
function MatchedPlayer:getParticipantData()
	if self:getAttribute("participantData") ~= nil then
		return self:getAttribute("participantData")
  	end
	
  	return nil
  	
end
		
-- The ID for player
-- method type 5 - primitive return type
function MatchedPlayer:getPlayerId()
	if self:getAttribute("playerId") ~= nil then
		return self:getAttribute("playerId")
  	end
	
  	return nil
  	
end
		
-- The skill of the player in this match
-- method type 5 - primitive return type
function MatchedPlayer:getSkill()
	if self:getAttribute("skill") ~= nil then
		return self:getAttribute("skill")
  	end
	
  	return math.nan
  	
end

return MatchedPlayer

