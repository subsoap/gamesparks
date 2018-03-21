local GSRequest = require("gamesparks.GSRequest")
local RevokePurchaseGoodsResponse = require("gamesparks.responses.RevokePurchaseGoodsResponse")

local RevokePurchaseGoodsRequest = {}
local RevokePurchaseGoodsRequest_mt = {__index = RevokePurchaseGoodsRequest}

function RevokePurchaseGoodsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".RevokePurchaseGoodsRequest"
  
  return setmetatable(instance, RevokePurchaseGoodsRequest_mt)
end

setmetatable(RevokePurchaseGoodsRequest, {__index = GSRequest})

function RevokePurchaseGoodsRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function RevokePurchaseGoodsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(RevokePurchaseGoodsResponse.new(message))
    end
  end)
end

	
function RevokePurchaseGoodsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function RevokePurchaseGoodsRequest:setPlayerId(playerId)
	self:setAttribute("playerId", playerId)
end
	
	
	
function RevokePurchaseGoodsRequest:setStoreType(storeType)
	self:setAttribute("storeType", storeType)
end
	
	
	
function RevokePurchaseGoodsRequest:setTransactionIds(transactionIds)
	self:setAttribute("transactionIds", transactionIds)
end

return RevokePurchaseGoodsRequest
