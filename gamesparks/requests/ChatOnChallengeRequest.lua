local GSRequest = require("gamesparks.GSRequest")
local ChatOnChallengeResponse = require("gamesparks.responses.ChatOnChallengeResponse")

local ChatOnChallengeRequest = {}
local ChatOnChallengeRequest_mt = {__index = ChatOnChallengeRequest}

function ChatOnChallengeRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ChatOnChallengeRequest"
  
  return setmetatable(instance, ChatOnChallengeRequest_mt)
end

setmetatable(ChatOnChallengeRequest, {__index = GSRequest})

function ChatOnChallengeRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function ChatOnChallengeRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ChatOnChallengeResponse.new(message))
    end
  end)
end

	
function ChatOnChallengeRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function ChatOnChallengeRequest:setChallengeInstanceId(challengeInstanceId)
	self:setAttribute("challengeInstanceId", challengeInstanceId)
end
	
	
	
function ChatOnChallengeRequest:setMessage(message)
	self:setAttribute("message", message)
end

return ChatOnChallengeRequest
