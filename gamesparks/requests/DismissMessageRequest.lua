local GSRequest = require("gamesparks.GSRequest")
local DismissMessageResponse = require("gamesparks.responses.DismissMessageResponse")

local DismissMessageRequest = {}
local DismissMessageRequest_mt = {__index = DismissMessageRequest}

function DismissMessageRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".DismissMessageRequest"
  
  return setmetatable(instance, DismissMessageRequest_mt)
end

setmetatable(DismissMessageRequest, {__index = GSRequest})

function DismissMessageRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function DismissMessageRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(DismissMessageResponse.new(message))
    end
  end)
end

	
function DismissMessageRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function DismissMessageRequest:setMessageId(messageId)
	self:setAttribute("messageId", messageId)
end

return DismissMessageRequest
