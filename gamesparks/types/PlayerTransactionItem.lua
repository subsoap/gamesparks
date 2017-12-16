
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local PlayerTransactionItem = {}
local PlayerTransactionItem_mt = {__index = PlayerTransactionItem}

function PlayerTransactionItem.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, PlayerTransactionItem_mt)
end

setmetatable(PlayerTransactionItem, {__index = GSData})

	
		
-- The amount of this item given to the player in the transaction
-- method type 5 - primitive return type
function PlayerTransactionItem:getAmount()
	if self:getAttribute("amount") ~= nil then
		return self:getAttribute("amount")
  	end
	
  	return math.nan
  	
end
		
-- The quantity the player possesses after the transaction completed
-- method type 5 - primitive return type
function PlayerTransactionItem:getNewValue()
	if self:getAttribute("newValue") ~= nil then
		return self:getAttribute("newValue")
  	end
	
  	return math.nan
  	
end
		
-- The type of item
-- method type 5 - primitive return type
function PlayerTransactionItem:getType()
	if self:getAttribute("type") ~= nil then
		return self:getAttribute("type")
  	end
	
  	return nil
  	
end

return PlayerTransactionItem

