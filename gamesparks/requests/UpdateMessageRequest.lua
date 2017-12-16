local GSRequest = require("gamesparks.GSRequest")
local UpdateMessageResponse = require("gamesparks.responses.UpdateMessageResponse")

local UpdateMessageRequest = {}
local UpdateMessageRequest_mt = {__index = UpdateMessageRequest}

function UpdateMessageRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".UpdateMessageRequest"
  
  return setmetatable(instance, UpdateMessageRequest_mt)
end

setmetatable(UpdateMessageRequest, {__index = GSRequest})

function UpdateMessageRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function UpdateMessageRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(UpdateMessageResponse.new(message))
    end
  end)
end

	
function UpdateMessageRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function UpdateMessageRequest:setMessageId(messageId)
	self:setAttribute("messageId", messageId)
end
	
	
	
function UpdateMessageRequest:setStatus(status)
	self:setAttribute("status", status)
end

return UpdateMessageRequest
