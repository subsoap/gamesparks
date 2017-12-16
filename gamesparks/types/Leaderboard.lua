
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local Leaderboard = {}
local Leaderboard_mt = {__index = Leaderboard}

function Leaderboard.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, Leaderboard_mt)
end

setmetatable(Leaderboard, {__index = GSData})

	
		
-- The leaderboard's description.
-- method type 5 - primitive return type
function Leaderboard:getDescription()
	if self:getAttribute("description") ~= nil then
		return self:getAttribute("description")
  	end
	
  	return nil
  	
end
		
-- The leaderboard's name.
-- method type 5 - primitive return type
function Leaderboard:getName()
	if self:getAttribute("name") ~= nil then
		return self:getAttribute("name")
  	end
	
  	return nil
  	
end
		
-- The custom property set configured on this Leaderboard
-- method type 5 - primitive return type
function Leaderboard:getPropertySet()
	if self:getAttribute("propertySet") ~= nil then
		return self:getAttribute("propertySet")
  	end
	
  	return nil
  	
end
		
-- The leaderboard's short code.
-- method type 5 - primitive return type
function Leaderboard:getShortCode()
	if self:getAttribute("shortCode") ~= nil then
		return self:getAttribute("shortCode")
  	end
	
  	return nil
  	
end

return Leaderboard

