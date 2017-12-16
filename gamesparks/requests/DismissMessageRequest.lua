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

function DismissMessageRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
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
