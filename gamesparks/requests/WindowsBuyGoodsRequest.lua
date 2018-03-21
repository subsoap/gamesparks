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

function WindowsBuyGoodsRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
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
