local GSRequest = require("gamesparks.GSRequest")
local BuyVirtualGoodResponse = require("gamesparks.responses.BuyVirtualGoodResponse")

local WindowsBuyGoodsRequest = {}
local WindowsBuyGoodsRequest_mt = {__index = WindowsBuyGoodsRequest}

function WindowsBuyGoodsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".WindowsBuyGoodsRequest"
  
  return setmetatable(instance, WindowsBuyGoodsRequest_mt)
end

setmetatable(WindowsBuyGoodsRequest, {__index = GSRequest})

function WindowsBuyGoodsRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function WindowsBuyGoodsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(BuyVirtualGoodResponse.new(message))
    end
  end)
end

	
function WindowsBuyGoodsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function WindowsBuyGoodsRequest:setCurrencyCode(currencyCode)
	self:setAttribute("currencyCode", currencyCode)
end
	
	
	
function WindowsBuyGoodsRequest:setPlatform(platform)
	self:setAttribute("platform", platform)
end
	
	
	
function WindowsBuyGoodsRequest:setReceipt(receipt)
	self:setAttribute("receipt", receipt)
end
	
	
	
function WindowsBuyGoodsRequest:setSubUnitPrice(subUnitPrice)
	self:setAttribute("subUnitPrice", subUnitPrice)
end
	
	
	
function WindowsBuyGoodsRequest:setUniqueTransactionByPlayer(uniqueTransactionByPlayer)
	self:setAttribute("uniqueTransactionByPlayer", uniqueTransactionByPlayer)
end

return WindowsBuyGoodsRequest
