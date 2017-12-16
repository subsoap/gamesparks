
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")

local PlayerTransactionItem = require("gamesparks.types.PlayerTransactionItem")


local PlayerTransaction = {}
local PlayerTransaction_mt = {__index = PlayerTransaction}

function PlayerTransaction.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, PlayerTransaction_mt)
end

setmetatable(PlayerTransaction, {__index = GSData})

	
		
-- The items (currency or virtual goods) involved in this transaction
-- method type 1 - typed object array return type
function PlayerTransaction:getItems()
	local ret = {}
	local items = self:getAttribute("items")
	
	if items ~= nil then
		for a = 1, #items do
	    	ret[a] = PlayerTransactionItem.new(items[a])
	    end
	end
	  
	return ret
end
			
		
-- The original request ID for this transaction
-- method type 5 - primitive return type
function PlayerTransaction:getOriginalRequestId()
	if self:getAttribute("originalRequestId") ~= nil then
		return self:getAttribute("originalRequestId")
  	end
	
  	return nil
  	
end
		
-- The player ID
-- method type 5 - primitive return type
function PlayerTransaction:getPlayerId()
	if self:getAttribute("playerId") ~= nil then
		return self:getAttribute("playerId")
  	end
	
  	return nil
  	
end
		
-- The reason for the transaction
-- method type 5 - primitive return type
function PlayerTransaction:getReason()
	if self:getAttribute("reason") ~= nil then
		return self:getAttribute("reason")
  	end
	
  	return nil
  	
end
		
-- Gets the date when this transaction was revoked, if applicable
-- method type 5 - primitive return type
function PlayerTransaction:getRevokeDate()
	if self:getAttribute("revokeDate") ~= nil then
		return rfc3339toDate(self:getAttribute("revokeDate"));
  	end
	
  	return nil
  	
end
		
-- Is true if the transaction was revoked
-- method type 5 - primitive return type
function PlayerTransaction:getRevoked()
	if self:getAttribute("revoked") ~= nil then
		return self:getAttribute("revoked")
  	end
	
  	return false
  	
end
		
-- The specific script in which this transaction occurred
-- method type 5 - primitive return type
function PlayerTransaction:getScript()
	if self:getAttribute("script") ~= nil then
		return self:getAttribute("script")
  	end
	
  	return nil
  	
end
		
-- The script type in which this transaction occurred (e.g. event)
-- method type 5 - primitive return type
function PlayerTransaction:getScriptType()
	if self:getAttribute("scriptType") ~= nil then
		return self:getAttribute("scriptType")
  	end
	
  	return nil
  	
end
		
-- The transaction ID of this purchase, if applicable
-- method type 5 - primitive return type
function PlayerTransaction:getTransactionId()
	if self:getAttribute("transactionId") ~= nil then
		return self:getAttribute("transactionId")
  	end
	
  	return nil
  	
end
		
-- The date of the transaction
-- method type 5 - primitive return type
function PlayerTransaction:getWhen()
	if self:getAttribute("when") ~= nil then
		return rfc3339toDate(self:getAttribute("when"));
  	end
	
  	return nil
  	
end

return PlayerTransaction

