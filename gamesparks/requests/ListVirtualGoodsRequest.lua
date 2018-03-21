local GSRequest = require("gamesparks.GSRequest")
local ListVirtualGoodsResponse = require("gamesparks.responses.ListVirtualGoodsResponse")

local ListVirtualGoodsRequest = {}
local ListVirtualGoodsRequest_mt = {__index = ListVirtualGoodsRequest}

function ListVirtualGoodsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ListVirtualGoodsRequest"
  
  return setmetatable(instance, ListVirtualGoodsRequest_mt)
end

setmetatable(ListVirtualGoodsRequest, {__index = GSRequest})

function ListVirtualGoodsRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function ListVirtualGoodsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ListVirtualGoodsResponse.new(message))
    end
  end)
end

	
function ListVirtualGoodsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function ListVirtualGoodsRequest:setIncludeDisabled(includeDisabled)
	self:setAttribute("includeDisabled", includeDisabled)
end
	
	
	
function ListVirtualGoodsRequest:setTags(tags)
	self:setAttribute("tags", tags)
end

return ListVirtualGoodsRequest
