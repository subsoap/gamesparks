
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local Player = {}
local Player_mt = {__index = Player}

function Player.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, Player_mt)
end

setmetatable(Player, {__index = GSData})

	
		
-- The achievements of the Player
-- method type 4 - primitive array return type
function Player:getAchievements()
	local ret = {}
	local achievements = self:getAttribute("achievements")
	
	if achievements ~= nil then
		for a = 1, #achievements do
	    	ret[a] = achievements[a]
	    end
	end
	  
	return ret
end
		
-- The display name of the Player
-- method type 5 - primitive return type
function Player:getDisplayName()
	if self:getAttribute("displayName") ~= nil then
		return self:getAttribute("displayName")
  	end
	
  	return nil
  	
end
		
-- The external Id's of the Player
-- method type 5 - primitive return type
function Player:getExternalIds()
	if self:getAttribute("externalIds") ~= nil then
		return self:getAttribute("externalIds")
  	end
	
  	return nil
  	
end
		
-- The Id of the Player
-- method type 5 - primitive return type
function Player:getId()
	if self:getAttribute("id") ~= nil then
		return self:getAttribute("id")
  	end
	
  	return nil
  	
end
		
-- The online status of the Player
-- method type 5 - primitive return type
function Player:getOnline()
	if self:getAttribute("online") ~= nil then
		return self:getAttribute("online")
  	end
	
  	return false
  	
end
		
-- The script data of the Player
-- method type 5 - primitive return type
function Player:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- The virtual goods of the Player
-- method type 4 - primitive array return type
function Player:getVirtualGoods()
	local ret = {}
	local virtualGoods = self:getAttribute("virtualGoods")
	
	if virtualGoods ~= nil then
		for a = 1, #virtualGoods do
	    	ret[a] = virtualGoods[a]
	    end
	end
	  
	return ret
end

return Player

