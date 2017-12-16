
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local PlayerTurnCount = {}
local PlayerTurnCount_mt = {__index = PlayerTurnCount}

function PlayerTurnCount.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, PlayerTurnCount_mt)
end

setmetatable(PlayerTurnCount, {__index = GSData})

	
		
-- The number of turns that the player has taken so far during this challenge.
-- method type 5 - primitive return type
function PlayerTurnCount:getCount()
	if self:getAttribute("count") ~= nil then
		return self:getAttribute("count")
  	end
	
  	return nil
  	
end
		
-- The unique player id.
-- method type 5 - primitive return type
function PlayerTurnCount:getPlayerId()
	if self:getAttribute("playerId") ~= nil then
		return self:getAttribute("playerId")
  	end
	
  	return nil
  	
end

return PlayerTurnCount

