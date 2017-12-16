local GSRequest = require("gamesparks.GSRequest")
local SendFriendMessageResponse = require("gamesparks.responses.SendFriendMessageResponse")

local SendFriendMessageRequest = {}
local SendFriendMessageRequest_mt = {__index = SendFriendMessageRequest}

function SendFriendMessageRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".SendFriendMessageRequest"
  
  return setmetatable(instance, SendFriendMessageRequest_mt)
end

setmetatable(SendFriendMessageRequest, {__index = GSRequest})

function SendFriendMessageRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function SendFriendMessageRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(SendFriendMessageResponse.new(message))
    end
  end)
end

	
function SendFriendMessageRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function SendFriendMessageRequest:setFriendIds(friendIds)
	self:setAttribute("friendIds", friendIds)
end
	
	
	
function SendFriendMessageRequest:setMessage(message)
	self:setAttribute("message", message)
end

return SendFriendMessageRequest
