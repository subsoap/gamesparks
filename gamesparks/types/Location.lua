
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local Location = {}
local Location_mt = {__index = Location}

function Location.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, Location_mt)
end

setmetatable(Location, {__index = GSData})

	
		
-- The city
-- method type 5 - primitive return type
function Location:getCity()
	if self:getAttribute("city") ~= nil then
		return self:getAttribute("city")
  	end
	
  	return nil
  	
end
		
-- The country
-- method type 5 - primitive return type
function Location:getCountry()
	if self:getAttribute("country") ~= nil then
		return self:getAttribute("country")
  	end
	
  	return nil
  	
end
		
-- The latitude
-- method type 5 - primitive return type
function Location:getLatitide()
	if self:getAttribute("latitide") ~= nil then
		return self:getAttribute("latitide")
  	end
	
  	return math.nan
  	
end
		
-- The longditute
-- method type 5 - primitive return type
function Location:getLongditute()
	if self:getAttribute("longditute") ~= nil then
		return self:getAttribute("longditute")
  	end
	
  	return math.nan
  	
end

return Location

