local GSRequest = require("gamesparks.GSRequest")
local BuyVirtualGoodResponse = require("gamesparks.responses.BuyVirtualGoodResponse")

local AmazonBuyGoodsRequest = {}
local AmazonBuyGoodsRequest_mt = {__index = AmazonBuyGoodsRequest}

function AmazonBuyGoodsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".AmazonBuyGoodsRequest"
  
  return setmetatable(instance, AmazonBuyGoodsRequest_mt)
end

setmetatable(AmazonBuyGoodsRequest, {__index = GSRequest})

function AmazonBuyGoodsRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function AmazonBuyGoodsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(BuyVirtualGoodResponse.new(message))
    end
  end)
end

	
function AmazonBuyGoodsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function AmazonBuyGoodsRequest:setAmazonUserId(amazonUserId)
	self:setAttribute("amazonUserId", amazonUserId)
end
	
	
	
function AmazonBuyGoodsRequest:setCurrencyCode(currencyCode)
	self:setAttribute("currencyCode", currencyCode)
end
	
	
	
function AmazonBuyGoodsRequest:setReceiptId(receiptId)
	self:setAttribute("receiptId", receiptId)
end
	
	
	
function AmazonBuyGoodsRequest:setSubUnitPrice(subUnitPrice)
	self:setAttribute("subUnitPrice", subUnitPrice)
end
	
	
	
function AmazonBuyGoodsRequest:setUniqueTransactionByPlayer(uniqueTransactionByPlayer)
	self:setAttribute("uniqueTransactionByPlayer", uniqueTransactionByPlayer)
end

return AmazonBuyGoodsRequest
