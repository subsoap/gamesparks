local GSRequest = require("gamesparks.GSRequest")
local SendTeamChatMessageResponse = require("gamesparks.responses.SendTeamChatMessageResponse")

local SendTeamChatMessageRequest = {}
local SendTeamChatMessageRequest_mt = {__index = SendTeamChatMessageRequest}

function SendTeamChatMessageRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".SendTeamChatMessageRequest"
  
  return setmetatable(instance, SendTeamChatMessageRequest_mt)
end

setmetatable(SendTeamChatMessageRequest, {__index = GSRequest})

function SendTeamChatMessageRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function SendTeamChatMessageRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(SendTeamChatMessageResponse.new(message))
    end
  end)
end

	
function SendTeamChatMessageRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function SendTeamChatMessageRequest:setMessage(message)
	self:setAttribute("message", message)
end
	
	
	
function SendTeamChatMessageRequest:setOwnerId(ownerId)
	self:setAttribute("ownerId", ownerId)
end
	
	
	
function SendTeamChatMessageRequest:setTeamId(teamId)
	self:setAttribute("teamId", teamId)
end
	
	
	
function SendTeamChatMessageRequest:setTeamType(teamType)
	self:setAttribute("teamType", teamType)
end

return SendTeamChatMessageRequest
