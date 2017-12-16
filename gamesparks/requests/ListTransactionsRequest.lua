local GSRequest = require("gamesparks.GSRequest")
local ListTransactionsResponse = require("gamesparks.responses.ListTransactionsResponse")

local ListTransactionsRequest = {}
local ListTransactionsRequest_mt = {__index = ListTransactionsRequest}

function ListTransactionsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ListTransactionsRequest"
  
  return setmetatable(instance, ListTransactionsRequest_mt)
end

setmetatable(ListTransactionsRequest, {__index = GSRequest})

function ListTransactionsRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function ListTransactionsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ListTransactionsResponse.new(message))
    end
  end)
end

	
function ListTransactionsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function ListTransactionsRequest:setDateFrom(dateFrom)
	self:setAttribute("dateFrom", dateFrom)
end
	
	
	
function ListTransactionsRequest:setDateTo(dateTo)
	self:setAttribute("dateTo", dateTo)
end
	
	
	
function ListTransactionsRequest:setEntryCount(entryCount)
	self:setAttribute("entryCount", entryCount)
end
	
	
	
function ListTransactionsRequest:setInclude(include)
	self:setAttribute("include", include)
end
	
	
	
function ListTransactionsRequest:setOffset(offset)
	self:setAttribute("offset", offset)
end

return ListTransactionsRequest
