local GSRequest = require("gamesparks.GSRequest")
local AuthenticationResponse = require("gamesparks.responses.AuthenticationResponse")

local KongregateConnectRequest = {}
local KongregateConnectRequest_mt = {__index = KongregateConnectRequest}

function KongregateConnectRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".KongregateConnectRequest"
  
  return setmetatable(instance, KongregateConnectRequest_mt)
end

setmetatable(KongregateConnectRequest, {__index = GSRequest})

function KongregateConnectRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function KongregateConnectRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AuthenticationResponse.new(message))
    end
  end)
end

	
function KongregateConnectRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function KongregateConnectRequest:setDoNotLinkToCurrentPlayer(doNotLinkToCurrentPlayer)
	self:setAttribute("doNotLinkToCurrentPlayer", doNotLinkToCurrentPlayer)
end
	
	
	
function KongregateConnectRequest:setErrorOnSwitch(errorOnSwitch)
	self:setAttribute("errorOnSwitch", errorOnSwitch)
end
	
	
	
function KongregateConnectRequest:setGameAuthToken(gameAuthToken)
	self:setAttribute("gameAuthToken", gameAuthToken)
end
	
	
	
function KongregateConnectRequest:setSegments(segments)
	self:setAttribute("segments", segments)
end
	
	
	
function KongregateConnectRequest:setSwitchIfPossible(switchIfPossible)
	self:setAttribute("switchIfPossible", switchIfPossible)
end
	
	
	
function KongregateConnectRequest:setSyncDisplayName(syncDisplayName)
	self:setAttribute("syncDisplayName", syncDisplayName)
end
	
	
	
function KongregateConnectRequest:setUserId(userId)
	self:setAttribute("userId", userId)
end

return KongregateConnectRequest
