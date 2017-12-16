
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local Boughtitem = {}
local Boughtitem_mt = {__index = Boughtitem}

function Boughtitem.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, Boughtitem_mt)
end

setmetatable(Boughtitem, {__index = GSData})

	
		
-- The quantity of the bought item
-- method type 5 - primitive return type
function Boughtitem:getQuantity()
	if self:getAttribute("quantity") ~= nil then
		return self:getAttribute("quantity")
  	end
	
  	return math.nan
  	
end
		
-- The short code of the bought item
-- method type 5 - primitive return type
function Boughtitem:getShortCode()
	if self:getAttribute("shortCode") ~= nil then
		return self:getAttribute("shortCode")
  	end
	
  	return nil
  	
end

return Boughtitem

