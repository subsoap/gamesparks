
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Location = require("gamesparks.types.Location")


local AccountDetailsResponse = {}
local AccountDetailsResponse_mt = {__index = AccountDetailsResponse}

function AccountDetailsResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, AccountDetailsResponse_mt)
end

setmetatable(AccountDetailsResponse, {__index = GSResponse})

	
		
-- A JSON object containing the player's achievments
-- method type 4 - primitive array return type
function AccountDetailsResponse:getAchievements()
	local ret = {}
	local achievements = self:getAttribute("achievements")
	
	if achievements ~= nil then
		for a = 1, #achievements do
	    	ret[a] = achievements[a]
	    end
	end
	  
	return ret
end
		
-- A JSON object containing the player's currency balances
-- method type 5 - primitive return type
function AccountDetailsResponse:getCurrencies()
	if self:getAttribute("currencies") ~= nil then
		return self:getAttribute("currencies")
  	end
	
  	return nil
  	
end
		
-- The amount of type 1 currency that the player holds
-- method type 5 - primitive return type
function AccountDetailsResponse:getCurrency1()
	if self:getAttribute("currency1") ~= nil then
		return self:getAttribute("currency1")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 2 currency that the player holds
-- method type 5 - primitive return type
function AccountDetailsResponse:getCurrency2()
	if self:getAttribute("currency2") ~= nil then
		return self:getAttribute("currency2")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 3 currency that the player holds
-- method type 5 - primitive return type
function AccountDetailsResponse:getCurrency3()
	if self:getAttribute("currency3") ~= nil then
		return self:getAttribute("currency3")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 4 currency that the player holds
-- method type 5 - primitive return type
function AccountDetailsResponse:getCurrency4()
	if self:getAttribute("currency4") ~= nil then
		return self:getAttribute("currency4")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 5 currency that the player holds
-- method type 5 - primitive return type
function AccountDetailsResponse:getCurrency5()
	if self:getAttribute("currency5") ~= nil then
		return self:getAttribute("currency5")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 6 currency that the player holds
-- method type 5 - primitive return type
function AccountDetailsResponse:getCurrency6()
	if self:getAttribute("currency6") ~= nil then
		return self:getAttribute("currency6")
  	end
	
  	return math.nan
  	
end
		
-- The player's display name
-- method type 5 - primitive return type
function AccountDetailsResponse:getDisplayName()
	if self:getAttribute("displayName") ~= nil then
		return self:getAttribute("displayName")
  	end
	
  	return nil
  	
end
		
-- A JSON object containing the player's external account details
-- method type 5 - primitive return type
function AccountDetailsResponse:getExternalIds()
	if self:getAttribute("externalIds") ~= nil then
		return self:getAttribute("externalIds")
  	end
	
  	return nil
  	
end
		
-- A JSON object containing the player's location
-- method type 2 - typed object return type
function AccountDetailsResponse:getLocation()
	if self:getAttribute("location") ~= nil then
		return Location.new(self:getAttribute("location"))
	end
	  
	return nil
end		
				
		
-- A JSON object containing the player's currency balances
-- method type 5 - primitive return type
function AccountDetailsResponse:getReservedCurrencies()
	if self:getAttribute("reservedCurrencies") ~= nil then
		return self:getAttribute("reservedCurrencies")
  	end
	
  	return nil
  	
end
		
-- The amount of type 1 currency that the player holds which is currently reserved
-- method type 5 - primitive return type
function AccountDetailsResponse:getReservedCurrency1()
	if self:getAttribute("reservedCurrency1") ~= nil then
		return self:getAttribute("reservedCurrency1")
  	end
	
  	return nil
  	
end
		
-- The amount of type 2 currency that the player holds which is currently reserved
-- method type 5 - primitive return type
function AccountDetailsResponse:getReservedCurrency2()
	if self:getAttribute("reservedCurrency2") ~= nil then
		return self:getAttribute("reservedCurrency2")
  	end
	
  	return nil
  	
end
		
-- The amount of type 3 currency that the player holds which is currently reserved
-- method type 5 - primitive return type
function AccountDetailsResponse:getReservedCurrency3()
	if self:getAttribute("reservedCurrency3") ~= nil then
		return self:getAttribute("reservedCurrency3")
  	end
	
  	return nil
  	
end
		
-- The amount of type 4 currency that the player holds which is currently reserved
-- method type 5 - primitive return type
function AccountDetailsResponse:getReservedCurrency4()
	if self:getAttribute("reservedCurrency4") ~= nil then
		return self:getAttribute("reservedCurrency4")
  	end
	
  	return nil
  	
end
		
-- The amount of type 5 currency that the player holds which is currently reserved
-- method type 5 - primitive return type
function AccountDetailsResponse:getReservedCurrency5()
	if self:getAttribute("reservedCurrency5") ~= nil then
		return self:getAttribute("reservedCurrency5")
  	end
	
  	return nil
  	
end
		
-- The amount of type 6 currency that the player holds which is currently reserved
-- method type 5 - primitive return type
function AccountDetailsResponse:getReservedCurrency6()
	if self:getAttribute("reservedCurrency6") ~= nil then
		return self:getAttribute("reservedCurrency6")
  	end
	
  	return nil
  	
end
		
-- The player's id
-- method type 5 - primitive return type
function AccountDetailsResponse:getUserId()
	if self:getAttribute("userId") ~= nil then
		return self:getAttribute("userId")
  	end
	
  	return nil
  	
end
		
-- A JSON object containing the virtual goods that the player owns
-- method type 5 - primitive return type
function AccountDetailsResponse:getVirtualGoods()
	if self:getAttribute("virtualGoods") ~= nil then
		return self:getAttribute("virtualGoods")
  	end
	
  	return nil
  	
end

return AccountDetailsResponse

