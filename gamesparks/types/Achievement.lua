
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local Achievement = {}
local Achievement_mt = {__index = Achievement}

function Achievement.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, Achievement_mt)
end

setmetatable(Achievement, {__index = GSData})

	
		
-- The desciption of the Achievement
-- method type 5 - primitive return type
function Achievement:getDescription()
	if self:getAttribute("description") ~= nil then
		return self:getAttribute("description")
  	end
	
  	return nil
  	
end
		
-- Whether to current player has earned the achievement
-- method type 5 - primitive return type
function Achievement:getEarned()
	if self:getAttribute("earned") ~= nil then
		return self:getAttribute("earned")
  	end
	
  	return false
  	
end
		
-- The name of the Achievement
-- method type 5 - primitive return type
function Achievement:getName()
	if self:getAttribute("name") ~= nil then
		return self:getAttribute("name")
  	end
	
  	return nil
  	
end
		
-- The custom property set configured on this Achievement
-- method type 5 - primitive return type
function Achievement:getPropertySet()
	if self:getAttribute("propertySet") ~= nil then
		return self:getAttribute("propertySet")
  	end
	
  	return nil
  	
end
		
-- The shortCode of the Achievement
-- method type 5 - primitive return type
function Achievement:getShortCode()
	if self:getAttribute("shortCode") ~= nil then
		return self:getAttribute("shortCode")
  	end
	
  	return nil
  	
end

return Achievement

