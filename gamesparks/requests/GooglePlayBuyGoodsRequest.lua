local GSRequest = require("gamesparks.GSRequest")
local BuyVirtualGoodResponse = require("gamesparks.responses.BuyVirtualGoodResponse")

local GooglePlayBuyGoodsRequest = {}
local GooglePlayBuyGoodsRequest_mt = {__index = GooglePlayBuyGoodsRequest}

function GooglePlayBuyGoodsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".GooglePlayBuyGoodsRequest"
  
  return setmetatable(instance, GooglePlayBuyGoodsRequest_mt)
end

setmetatable(GooglePlayBuyGoodsRequest, {__index = GSRequest})

function GooglePlayBuyGoodsRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function GooglePlayBuyGoodsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(BuyVirtualGoodResponse.new(message))
    end
  end)
end

	
function GooglePlayBuyGoodsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function GooglePlayBuyGoodsRequest:setCurrencyCode(currencyCode)
	self:setAttribute("currencyCode", currencyCode)
end
	
	
	
function GooglePlayBuyGoodsRequest:setSignature(signature)
	self:setAttribute("signature", signature)
end
	
	
	
function GooglePlayBuyGoodsRequest:setSignedData(signedData)
	self:setAttribute("signedData", signedData)
end
	
	
	
function GooglePlayBuyGoodsRequest:setSubUnitPrice(subUnitPrice)
	self:setAttribute("subUnitPrice", subUnitPrice)
end
	
	
	
function GooglePlayBuyGoodsRequest:setUniqueTransactionByPlayer(uniqueTransactionByPlayer)
	self:setAttribute("uniqueTransactionByPlayer", uniqueTransactionByPlayer)
end

return GooglePlayBuyGoodsRequest
