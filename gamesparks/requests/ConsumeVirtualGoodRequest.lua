local GSRequest = require("gamesparks.GSRequest")
local ConsumeVirtualGoodResponse = require("gamesparks.responses.ConsumeVirtualGoodResponse")

local ConsumeVirtualGoodRequest = {}
local ConsumeVirtualGoodRequest_mt = {__index = ConsumeVirtualGoodRequest}

function ConsumeVirtualGoodRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ConsumeVirtualGoodRequest"
  
  return setmetatable(instance, ConsumeVirtualGoodRequest_mt)
end

setmetatable(ConsumeVirtualGoodRequest, {__index = GSRequest})

function ConsumeVirtualGoodRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function ConsumeVirtualGoodRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ConsumeVirtualGoodResponse.new(message))
    end
  end)
end

	
function ConsumeVirtualGoodRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function ConsumeVirtualGoodRequest:setQuantity(quantity)
	self:setAttribute("quantity", quantity)
end
	
	
	
function ConsumeVirtualGoodRequest:setShortCode(shortCode)
	self:setAttribute("shortCode", shortCode)
end

return ConsumeVirtualGoodRequest
