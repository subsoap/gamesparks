local GSRequest = require("gamesparks.GSRequest")
local BuyVirtualGoodResponse = require("gamesparks.responses.BuyVirtualGoodResponse")

local SteamBuyGoodsRequest = {}
local SteamBuyGoodsRequest_mt = {__index = SteamBuyGoodsRequest}

function SteamBuyGoodsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".SteamBuyGoodsRequest"
  
  return setmetatable(instance, SteamBuyGoodsRequest_mt)
end

setmetatable(SteamBuyGoodsRequest, {__index = GSRequest})

function SteamBuyGoodsRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function SteamBuyGoodsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(BuyVirtualGoodResponse.new(message))
    end
  end)
end

	
function SteamBuyGoodsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function SteamBuyGoodsRequest:setCurrencyCode(currencyCode)
	self:setAttribute("currencyCode", currencyCode)
end
	
	
	
function SteamBuyGoodsRequest:setOrderId(orderId)
	self:setAttribute("orderId", orderId)
end
	
	
	
function SteamBuyGoodsRequest:setSubUnitPrice(subUnitPrice)
	self:setAttribute("subUnitPrice", subUnitPrice)
end
	
	
	
function SteamBuyGoodsRequest:setUniqueTransactionByPlayer(uniqueTransactionByPlayer)
	self:setAttribute("uniqueTransactionByPlayer", uniqueTransactionByPlayer)
end

return SteamBuyGoodsRequest
