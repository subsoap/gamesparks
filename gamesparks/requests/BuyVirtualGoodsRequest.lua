local GSRequest = require("gamesparks.GSRequest")
local BuyVirtualGoodResponse = require("gamesparks.responses.BuyVirtualGoodResponse")

local BuyVirtualGoodsRequest = {}
local BuyVirtualGoodsRequest_mt = {__index = BuyVirtualGoodsRequest}

function BuyVirtualGoodsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".BuyVirtualGoodsRequest"
  
  return setmetatable(instance, BuyVirtualGoodsRequest_mt)
end

setmetatable(BuyVirtualGoodsRequest, {__index = GSRequest})

function BuyVirtualGoodsRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function BuyVirtualGoodsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(BuyVirtualGoodResponse.new(message))
    end
  end)
end

	
function BuyVirtualGoodsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function BuyVirtualGoodsRequest:setCurrencyShortCode(currencyShortCode)
	self:setAttribute("currencyShortCode", currencyShortCode)
end
	
	
	
function BuyVirtualGoodsRequest:setCurrencyType(currencyType)
	self:setAttribute("currencyType", currencyType)
end
	
	
	
function BuyVirtualGoodsRequest:setQuantity(quantity)
	self:setAttribute("quantity", quantity)
end
	
	
	
function BuyVirtualGoodsRequest:setShortCode(shortCode)
	self:setAttribute("shortCode", shortCode)
end

return BuyVirtualGoodsRequest
