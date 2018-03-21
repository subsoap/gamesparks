local GSRequest = require("gamesparks.GSRequest")
local BuyVirtualGoodResponse = require("gamesparks.responses.BuyVirtualGoodResponse")

local IOSBuyGoodsRequest = {}
local IOSBuyGoodsRequest_mt = {__index = IOSBuyGoodsRequest}

function IOSBuyGoodsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".IOSBuyGoodsRequest"
  
  return setmetatable(instance, IOSBuyGoodsRequest_mt)
end

setmetatable(IOSBuyGoodsRequest, {__index = GSRequest})

function IOSBuyGoodsRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function IOSBuyGoodsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(BuyVirtualGoodResponse.new(message))
    end
  end)
end

	
function IOSBuyGoodsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function IOSBuyGoodsRequest:setCurrencyCode(currencyCode)
	self:setAttribute("currencyCode", currencyCode)
end
	
	
	
function IOSBuyGoodsRequest:setReceipt(receipt)
	self:setAttribute("receipt", receipt)
end
	
	
	
function IOSBuyGoodsRequest:setSandbox(sandbox)
	self:setAttribute("sandbox", sandbox)
end
	
	
	
function IOSBuyGoodsRequest:setSubUnitPrice(subUnitPrice)
	self:setAttribute("subUnitPrice", subUnitPrice)
end
	
	
	
function IOSBuyGoodsRequest:setUniqueTransactionByPlayer(uniqueTransactionByPlayer)
	self:setAttribute("uniqueTransactionByPlayer", uniqueTransactionByPlayer)
end

return IOSBuyGoodsRequest
