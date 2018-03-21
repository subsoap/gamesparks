local GSRequest = require("gamesparks.GSRequest")
local ListMessageDetailResponse = require("gamesparks.responses.ListMessageDetailResponse")

local ListMessageDetailRequest = {}
local ListMessageDetailRequest_mt = {__index = ListMessageDetailRequest}

function ListMessageDetailRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ListMessageDetailRequest"
  
  return setmetatable(instance, ListMessageDetailRequest_mt)
end

setmetatable(ListMessageDetailRequest, {__index = GSRequest})

function ListMessageDetailRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function ListMessageDetailRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ListMessageDetailResponse.new(message))
    end
  end)
end

	
function ListMessageDetailRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function ListMessageDetailRequest:setEntryCount(entryCount)
	self:setAttribute("entryCount", entryCount)
end
	
	
	
function ListMessageDetailRequest:setInclude(include)
	self:setAttribute("include", include)
end
	
	
	
function ListMessageDetailRequest:setOffset(offset)
	self:setAttribute("offset", offset)
end
	
	
	
function ListMessageDetailRequest:setStatus(status)
	self:setAttribute("status", status)
end

return ListMessageDetailRequest
