local GSRequest = require("gamesparks.GSRequest")
local AuthenticationResponse = require("gamesparks.responses.AuthenticationResponse")

local PSNConnectRequest = {}
local PSNConnectRequest_mt = {__index = PSNConnectRequest}

function PSNConnectRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".PSNConnectRequest"
  
  return setmetatable(instance, PSNConnectRequest_mt)
end

setmetatable(PSNConnectRequest, {__index = GSRequest})

function PSNConnectRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function PSNConnectRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AuthenticationResponse.new(message))
    end
  end)
end

	
function PSNConnectRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function PSNConnectRequest:setAuthorizationCode(authorizationCode)
	self:setAttribute("authorizationCode", authorizationCode)
end
	
	
	
function PSNConnectRequest:setDoNotLinkToCurrentPlayer(doNotLinkToCurrentPlayer)
	self:setAttribute("doNotLinkToCurrentPlayer", doNotLinkToCurrentPlayer)
end
	
	
	
function PSNConnectRequest:setErrorOnSwitch(errorOnSwitch)
	self:setAttribute("errorOnSwitch", errorOnSwitch)
end
	
	
	
function PSNConnectRequest:setRedirectUri(redirectUri)
	self:setAttribute("redirectUri", redirectUri)
end
	
	
	
function PSNConnectRequest:setSegments(segments)
	self:setAttribute("segments", segments)
end
	
	
	
function PSNConnectRequest:setSwitchIfPossible(switchIfPossible)
	self:setAttribute("switchIfPossible", switchIfPossible)
end
	
	
	
function PSNConnectRequest:setSyncDisplayName(syncDisplayName)
	self:setAttribute("syncDisplayName", syncDisplayName)
end

return PSNConnectRequest
