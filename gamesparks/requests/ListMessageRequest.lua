local GSRequest = require("gamesparks.GSRequest")
local ListMessageResponse = require("gamesparks.responses.ListMessageResponse")

local ListMessageRequest = {}
local ListMessageRequest_mt = {__index = ListMessageRequest}

function ListMessageRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ListMessageRequest"
  
  return setmetatable(instance, ListMessageRequest_mt)
end

setmetatable(ListMessageRequest, {__index = GSRequest})

function ListMessageRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function ListMessageRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ListMessageResponse.new(message))
    end
  end)
end

	
function ListMessageRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function ListMessageRequest:setEntryCount(entryCount)
	self:setAttribute("entryCount", entryCount)
end
	
	
	
function ListMessageRequest:setInclude(include)
	self:setAttribute("include", include)
end
	
	
	
function ListMessageRequest:setOffset(offset)
	self:setAttribute("offset", offset)
end

return ListMessageRequest
