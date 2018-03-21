local GSRequest = require("gamesparks.GSRequest")
local ListMessageSummaryResponse = require("gamesparks.responses.ListMessageSummaryResponse")

local ListMessageSummaryRequest = {}
local ListMessageSummaryRequest_mt = {__index = ListMessageSummaryRequest}

function ListMessageSummaryRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ListMessageSummaryRequest"
  
  return setmetatable(instance, ListMessageSummaryRequest_mt)
end

setmetatable(ListMessageSummaryRequest, {__index = GSRequest})

function ListMessageSummaryRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function ListMessageSummaryRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ListMessageSummaryResponse.new(message))
    end
  end)
end

	
function ListMessageSummaryRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function ListMessageSummaryRequest:setEntryCount(entryCount)
	self:setAttribute("entryCount", entryCount)
end
	
	
	
function ListMessageSummaryRequest:setOffset(offset)
	self:setAttribute("offset", offset)
end

return ListMessageSummaryRequest
