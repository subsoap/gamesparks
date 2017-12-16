local GSRequest = require("gamesparks.GSRequest")
local BuyVirtualGoodResponse = require("gamesparks.responses.BuyVirtualGoodResponse")

local PsnBuyGoodsRequest = {}
local PsnBuyGoodsRequest_mt = {__index = PsnBuyGoodsRequest}

function PsnBuyGoodsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".PsnBuyGoodsRequest"
  
  return setmetatable(instance, PsnBuyGoodsRequest_mt)
end

setmetatable(PsnBuyGoodsRequest, {__index = GSRequest})

function PsnBuyGoodsRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function PsnBuyGoodsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(BuyVirtualGoodResponse.new(message))
    end
  end)
end

	
function PsnBuyGoodsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function PsnBuyGoodsRequest:setAuthorizationCode(authorizationCode)
	self:setAttribute("authorizationCode", authorizationCode)
end
	
	
	
function PsnBuyGoodsRequest:setCurrencyCode(currencyCode)
	self:setAttribute("currencyCode", currencyCode)
end
	
	
	
function PsnBuyGoodsRequest:setEntitlementLabel(entitlementLabel)
	self:setAttribute("entitlementLabel", entitlementLabel)
end
	
	
	
function PsnBuyGoodsRequest:setRedirectUri(redirectUri)
	self:setAttribute("redirectUri", redirectUri)
end
	
	
	
function PsnBuyGoodsRequest:setSubUnitPrice(subUnitPrice)
	self:setAttribute("subUnitPrice", subUnitPrice)
end
	
	
	
function PsnBuyGoodsRequest:setUniqueTransactionByPlayer(uniqueTransactionByPlayer)
	self:setAttribute("uniqueTransactionByPlayer", uniqueTransactionByPlayer)
end
	
	
	
function PsnBuyGoodsRequest:setUseCount(useCount)
	self:setAttribute("useCount", useCount)
end

return PsnBuyGoodsRequest
