local GSRequest = require("gamesparks.GSRequest")
local DismissMultipleMessagesResponse = require("gamesparks.responses.DismissMultipleMessagesResponse")

local DismissMultipleMessagesRequest = {}
local DismissMultipleMessagesRequest_mt = {__index = DismissMultipleMessagesRequest}

function DismissMultipleMessagesRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".DismissMultipleMessagesRequest"
  
  return setmetatable(instance, DismissMultipleMessagesRequest_mt)
end

setmetatable(DismissMultipleMessagesRequest, {__index = GSRequest})

function DismissMultipleMessagesRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function DismissMultipleMessagesRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(DismissMultipleMessagesResponse.new(message))
    end
  end)
end

	
function DismissMultipleMessagesRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function DismissMultipleMessagesRequest:setMessageIds(messageIds)
	self:setAttribute("messageIds", messageIds)
end

return DismissMultipleMessagesRequest
