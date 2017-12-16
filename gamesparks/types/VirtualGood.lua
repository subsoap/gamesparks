
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")

local BundledGood = require("gamesparks.types.BundledGood")


local VirtualGood = {}
local VirtualGood_mt = {__index = VirtualGood}

function VirtualGood.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, VirtualGood_mt)
end

setmetatable(VirtualGood, {__index = GSData})

	
		
-- The Windows Phone 8 productId of the item.
-- method type 5 - primitive return type
function VirtualGood:getWP8StoreProductId()
	if self:getAttribute("WP8StoreProductId") ~= nil then
		return self:getAttribute("WP8StoreProductId")
  	end
	
  	return nil
  	
end
		
-- The Amazon Store productId of the item.
-- method type 5 - primitive return type
function VirtualGood:getAmazonStoreProductId()
	if self:getAttribute("amazonStoreProductId") ~= nil then
		return self:getAttribute("amazonStoreProductId")
  	end
	
  	return nil
  	
end
		
-- The Base Currency1 cost of the Virtual Good, before segmentation
-- method type 5 - primitive return type
function VirtualGood:getBaseCurrency1Cost()
	if self:getAttribute("baseCurrency1Cost") ~= nil then
		return self:getAttribute("baseCurrency1Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Base Currency2 cost of the Virtual Good, before segmentation
-- method type 5 - primitive return type
function VirtualGood:getBaseCurrency2Cost()
	if self:getAttribute("baseCurrency2Cost") ~= nil then
		return self:getAttribute("baseCurrency2Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Base Currency3 cost of the Virtual Good, before segmentation
-- method type 5 - primitive return type
function VirtualGood:getBaseCurrency3Cost()
	if self:getAttribute("baseCurrency3Cost") ~= nil then
		return self:getAttribute("baseCurrency3Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Base Currency4 cost of the Virtual Good, before segmentation
-- method type 5 - primitive return type
function VirtualGood:getBaseCurrency4Cost()
	if self:getAttribute("baseCurrency4Cost") ~= nil then
		return self:getAttribute("baseCurrency4Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Base Currency5 cost of the Virtual Good, before segmentation
-- method type 5 - primitive return type
function VirtualGood:getBaseCurrency5Cost()
	if self:getAttribute("baseCurrency5Cost") ~= nil then
		return self:getAttribute("baseCurrency5Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Base Currency6 cost of the Virtual Good, before segmentation
-- method type 5 - primitive return type
function VirtualGood:getBaseCurrency6Cost()
	if self:getAttribute("baseCurrency6Cost") ~= nil then
		return self:getAttribute("baseCurrency6Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Base currency costs of the Virtual Good, before experiments
-- method type 5 - primitive return type
function VirtualGood:getBaseCurrencyCosts()
	if self:getAttribute("baseCurrencyCosts") ~= nil then
		return self:getAttribute("baseCurrencyCosts")
  	end
	
  	return nil
  	
end
		
-- Returns the bundle goods of the virtual good
-- method type 1 - typed object array return type
function VirtualGood:getBundledGoods()
	local ret = {}
	local bundledGoods = self:getAttribute("bundledGoods")
	
	if bundledGoods ~= nil then
		for a = 1, #bundledGoods do
	    	ret[a] = BundledGood.new(bundledGoods[a])
	    end
	end
	  
	return ret
end
			
		
-- The Currency1 cost of the Virtual Good
-- method type 5 - primitive return type
function VirtualGood:getCurrency1Cost()
	if self:getAttribute("currency1Cost") ~= nil then
		return self:getAttribute("currency1Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Currency2 cost of the Virtual Good
-- method type 5 - primitive return type
function VirtualGood:getCurrency2Cost()
	if self:getAttribute("currency2Cost") ~= nil then
		return self:getAttribute("currency2Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Currency3 cost of the Virtual Good
-- method type 5 - primitive return type
function VirtualGood:getCurrency3Cost()
	if self:getAttribute("currency3Cost") ~= nil then
		return self:getAttribute("currency3Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Currency4 cost of the Virtual Good
-- method type 5 - primitive return type
function VirtualGood:getCurrency4Cost()
	if self:getAttribute("currency4Cost") ~= nil then
		return self:getAttribute("currency4Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Currency5 cost of the Virtual Good
-- method type 5 - primitive return type
function VirtualGood:getCurrency5Cost()
	if self:getAttribute("currency5Cost") ~= nil then
		return self:getAttribute("currency5Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Currency6 cost of the Virtual Good
-- method type 5 - primitive return type
function VirtualGood:getCurrency6Cost()
	if self:getAttribute("currency6Cost") ~= nil then
		return self:getAttribute("currency6Cost")
  	end
	
  	return math.nan
  	
end
		
-- The currency costs of the Virtual Good
-- method type 5 - primitive return type
function VirtualGood:getCurrencyCosts()
	if self:getAttribute("currencyCosts") ~= nil then
		return self:getAttribute("currencyCosts")
  	end
	
  	return nil
  	
end
		
-- The description of the Virtual Good
-- method type 5 - primitive return type
function VirtualGood:getDescription()
	if self:getAttribute("description") ~= nil then
		return self:getAttribute("description")
  	end
	
  	return nil
  	
end
		
-- Whether the item is disabled.
-- method type 5 - primitive return type
function VirtualGood:getDisabled()
	if self:getAttribute("disabled") ~= nil then
		return self:getAttribute("disabled")
  	end
	
  	return false
  	
end
		
-- The google play productId of the item.
-- method type 5 - primitive return type
function VirtualGood:getGooglePlayProductId()
	if self:getAttribute("googlePlayProductId") ~= nil then
		return self:getAttribute("googlePlayProductId")
  	end
	
  	return nil
  	
end
		
-- The iOS AppStore productId of the item.
-- method type 5 - primitive return type
function VirtualGood:getIosAppStoreProductId()
	if self:getAttribute("iosAppStoreProductId") ~= nil then
		return self:getAttribute("iosAppStoreProductId")
  	end
	
  	return nil
  	
end
		
-- The maximum number of the Virtual Good that can be owned at one time
-- method type 5 - primitive return type
function VirtualGood:getMaxQuantity()
	if self:getAttribute("maxQuantity") ~= nil then
		return self:getAttribute("maxQuantity")
  	end
	
  	return math.nan
  	
end
		
-- The name of the Virtual Good
-- method type 5 - primitive return type
function VirtualGood:getName()
	if self:getAttribute("name") ~= nil then
		return self:getAttribute("name")
  	end
	
  	return nil
  	
end
		
-- The custom property set configured on the item.
-- method type 5 - primitive return type
function VirtualGood:getPropertySet()
	if self:getAttribute("propertySet") ~= nil then
		return self:getAttribute("propertySet")
  	end
	
  	return nil
  	
end
		
-- The PSN Store productId of the item.
-- method type 5 - primitive return type
function VirtualGood:getPsnStoreProductId()
	if self:getAttribute("psnStoreProductId") ~= nil then
		return self:getAttribute("psnStoreProductId")
  	end
	
  	return nil
  	
end
		
-- The Segmented Currency1 cost of the Virtual Good, before experiments
-- method type 5 - primitive return type
function VirtualGood:getSegmentedCurrency1Cost()
	if self:getAttribute("segmentedCurrency1Cost") ~= nil then
		return self:getAttribute("segmentedCurrency1Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Segmented Currency2 cost of the Virtual Good, before experiments
-- method type 5 - primitive return type
function VirtualGood:getSegmentedCurrency2Cost()
	if self:getAttribute("segmentedCurrency2Cost") ~= nil then
		return self:getAttribute("segmentedCurrency2Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Segmented Currency3 cost of the Virtual Good, before experiments
-- method type 5 - primitive return type
function VirtualGood:getSegmentedCurrency3Cost()
	if self:getAttribute("segmentedCurrency3Cost") ~= nil then
		return self:getAttribute("segmentedCurrency3Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Segmented Currency4 cost of the Virtual Good, before experiments
-- method type 5 - primitive return type
function VirtualGood:getSegmentedCurrency4Cost()
	if self:getAttribute("segmentedCurrency4Cost") ~= nil then
		return self:getAttribute("segmentedCurrency4Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Segmented Currency5 cost of the Virtual Good, before experiments
-- method type 5 - primitive return type
function VirtualGood:getSegmentedCurrency5Cost()
	if self:getAttribute("segmentedCurrency5Cost") ~= nil then
		return self:getAttribute("segmentedCurrency5Cost")
  	end
	
  	return math.nan
  	
end
		
-- The Segmented Currency6 cost of the Virtual Good, before experiments
-- method type 5 - primitive return type
function VirtualGood:getSegmentedCurrency6Cost()
	if self:getAttribute("segmentedCurrency6Cost") ~= nil then
		return self:getAttribute("segmentedCurrency6Cost")
  	end
	
  	return math.nan
  	
end
		
-- The segmented currency costs of the Virtual Good, before experiments
-- method type 5 - primitive return type
function VirtualGood:getSegmentedCurrencyCosts()
	if self:getAttribute("segmentedCurrencyCosts") ~= nil then
		return self:getAttribute("segmentedCurrencyCosts")
  	end
	
  	return nil
  	
end
		
-- The short code of the Virtual Good
-- method type 5 - primitive return type
function VirtualGood:getShortCode()
	if self:getAttribute("shortCode") ~= nil then
		return self:getAttribute("shortCode")
  	end
	
  	return nil
  	
end
		
-- The Steam Store productId of the item.
-- method type 5 - primitive return type
function VirtualGood:getSteamStoreProductId()
	if self:getAttribute("steamStoreProductId") ~= nil then
		return self:getAttribute("steamStoreProductId")
  	end
	
  	return nil
  	
end
		
-- The tags of the Virtual Good
-- method type 5 - primitive return type
function VirtualGood:getTags()
	if self:getAttribute("tags") ~= nil then
		return self:getAttribute("tags")
  	end
	
  	return nil
  	
end
		
-- The type of the virtual good, "VGOOD" or "CURRENCY"
-- method type 5 - primitive return type
function VirtualGood:getType()
	if self:getAttribute("type") ~= nil then
		return self:getAttribute("type")
  	end
	
  	return nil
  	
end
		
-- The Windows 8 productId of the item.
-- method type 5 - primitive return type
function VirtualGood:getW8StoreProductId()
	if self:getAttribute("w8StoreProductId") ~= nil then
		return self:getAttribute("w8StoreProductId")
  	end
	
  	return nil
  	
end

return VirtualGood

