
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Boughtitem = require("gamesparks.types.Boughtitem")


local BuyVirtualGoodResponse = {}
local BuyVirtualGoodResponse_mt = {__index = BuyVirtualGoodResponse}

function BuyVirtualGoodResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, BuyVirtualGoodResponse_mt)
end

setmetatable(BuyVirtualGoodResponse, {__index = GSResponse})

	
		
-- A JSON object containing details of the bought items
-- method type 1 - typed object array return type
function BuyVirtualGoodResponse:getBoughtItems()
	local ret = {}
	local boughtItems = self:getAttribute("boughtItems")
	
	if boughtItems ~= nil then
		for a = 1, #boughtItems do
	    	ret[a] = Boughtitem.new(boughtItems[a])
	    end
	end
	  
	return ret
end
			
		
-- An object containing the short code and amount added for each currency
-- method type 5 - primitive return type
function BuyVirtualGoodResponse:getCurrenciesAdded()
	if self:getAttribute("currenciesAdded") ~= nil then
		return self:getAttribute("currenciesAdded")
  	end
	
  	return nil
  	
end
		
-- How much currency type 1 was added
-- method type 5 - primitive return type
function BuyVirtualGoodResponse:getCurrency1Added()
	if self:getAttribute("currency1Added") ~= nil then
		return self:getAttribute("currency1Added")
  	end
	
  	return math.nan
  	
end
		
-- How much currency type 2 was added
-- method type 5 - primitive return type
function BuyVirtualGoodResponse:getCurrency2Added()
	if self:getAttribute("currency2Added") ~= nil then
		return self:getAttribute("currency2Added")
  	end
	
  	return math.nan
  	
end
		
-- How much currency type 3 was added
-- method type 5 - primitive return type
function BuyVirtualGoodResponse:getCurrency3Added()
	if self:getAttribute("currency3Added") ~= nil then
		return self:getAttribute("currency3Added")
  	end
	
  	return math.nan
  	
end
		
-- How much currency type 4 was added
-- method type 5 - primitive return type
function BuyVirtualGoodResponse:getCurrency4Added()
	if self:getAttribute("currency4Added") ~= nil then
		return self:getAttribute("currency4Added")
  	end
	
  	return math.nan
  	
end
		
-- How much currency type 5 was added
-- method type 5 - primitive return type
function BuyVirtualGoodResponse:getCurrency5Added()
	if self:getAttribute("currency5Added") ~= nil then
		return self:getAttribute("currency5Added")
  	end
	
  	return math.nan
  	
end
		
-- How much currency type 6 was added
-- method type 5 - primitive return type
function BuyVirtualGoodResponse:getCurrency6Added()
	if self:getAttribute("currency6Added") ~= nil then
		return self:getAttribute("currency6Added")
  	end
	
  	return math.nan
  	
end
		
-- For a buy with currency request, how much currency was used
-- method type 5 - primitive return type
function BuyVirtualGoodResponse:getCurrencyConsumed()
	if self:getAttribute("currencyConsumed") ~= nil then
		return self:getAttribute("currencyConsumed")
  	end
	
  	return math.nan
  	
end
		
-- For a buy with currency request, the short code of the currency used
-- method type 5 - primitive return type
function BuyVirtualGoodResponse:getCurrencyShortCode()
	if self:getAttribute("currencyShortCode") ~= nil then
		return self:getAttribute("currencyShortCode")
  	end
	
  	return nil
  	
end
		
-- For a buy with currency request, which currency type was used
-- method type 5 - primitive return type
function BuyVirtualGoodResponse:getCurrencyType()
	if self:getAttribute("currencyType") ~= nil then
		return self:getAttribute("currencyType")
  	end
	
  	return nil
  	
end
		
-- A list of invalid items for this purchase (if any). This field is populated only for store buys
-- method type 4 - primitive array return type
function BuyVirtualGoodResponse:getInvalidItems()
	local ret = {}
	local invalidItems = self:getAttribute("invalidItems")
	
	if invalidItems ~= nil then
		for a = 1, #invalidItems do
	    	ret[a] = invalidItems[a]
	    end
	end
	  
	return ret
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function BuyVirtualGoodResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- The list of transactionIds, for this purchase, if they exist. This field is populated only for store buys
-- method type 4 - primitive array return type
function BuyVirtualGoodResponse:getTransactionIds()
	local ret = {}
	local transactionIds = self:getAttribute("transactionIds")
	
	if transactionIds ~= nil then
		for a = 1, #transactionIds do
	    	ret[a] = transactionIds[a]
	    end
	end
	  
	return ret
end

return BuyVirtualGoodResponse

