
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local BundledGood = {}
local BundledGood_mt = {__index = BundledGood}

function BundledGood.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, BundledGood_mt)
end

setmetatable(BundledGood, {__index = GSData})

	
		
-- The number of items bundled
-- method type 5 - primitive return type
function BundledGood:getQty()
	if self:getAttribute("qty") ~= nil then
		return self:getAttribute("qty")
  	end
	
  	return math.nan
  	
end
		
-- The shortCode of the bundled good
-- method type 5 - primitive return type
function BundledGood:getShortCode()
	if self:getAttribute("shortCode") ~= nil then
		return self:getAttribute("shortCode")
  	end
	
  	return nil
  	
end

return BundledGood

