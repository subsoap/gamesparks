local GSRequest = require("gamesparks.GSRequest")
local GetMessageResponse = require("gamesparks.responses.GetMessageResponse")

local GetMessageRequest = {}
local GetMessageRequest_mt = {__index = GetMessageRequest}

function GetMessageRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".GetMessageRequest"
  
  return setmetatable(instance, GetMessageRequest_mt)
end

setmetatable(GetMessageRequest, {__index = GSRequest})

function GetMessageRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function GetMessageRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(GetMessageResponse.new(message))
    end
  end)
end

	
function GetMessageRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function GetMessageRequest:setMessageId(messageId)
	self:setAttribute("messageId", messageId)
end

return GetMessageRequest
