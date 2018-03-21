local GSRequest = require("gamesparks.GSRequest")
local AuthenticationResponse = require("gamesparks.responses.AuthenticationResponse")

local GooglePlayConnectRequest = {}
local GooglePlayConnectRequest_mt = {__index = GooglePlayConnectRequest}

function GooglePlayConnectRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".GooglePlayConnectRequest"
  
  return setmetatable(instance, GooglePlayConnectRequest_mt)
end

setmetatable(GooglePlayConnectRequest, {__index = GSRequest})

function GooglePlayConnectRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function GooglePlayConnectRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AuthenticationResponse.new(message))
    end
  end)
end

	
function GooglePlayConnectRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function GooglePlayConnectRequest:setAccessToken(accessToken)
	self:setAttribute("accessToken", accessToken)
end
	
	
	
function GooglePlayConnectRequest:setCode(code)
	self:setAttribute("code", code)
end
	
	
	
function GooglePlayConnectRequest:setDisplayName(displayName)
	self:setAttribute("displayName", displayName)
end
	
	
	
function GooglePlayConnectRequest:setDoNotLinkToCurrentPlayer(doNotLinkToCurrentPlayer)
	self:setAttribute("doNotLinkToCurrentPlayer", doNotLinkToCurrentPlayer)
end
	
	
	
function GooglePlayConnectRequest:setErrorOnSwitch(errorOnSwitch)
	self:setAttribute("errorOnSwitch", errorOnSwitch)
end
	
	
	
function GooglePlayConnectRequest:setGooglePlusScope(googlePlusScope)
	self:setAttribute("googlePlusScope", googlePlusScope)
end
	
	
	
function GooglePlayConnectRequest:setProfileScope(profileScope)
	self:setAttribute("profileScope", profileScope)
end
	
	
	
function GooglePlayConnectRequest:setRedirectUri(redirectUri)
	self:setAttribute("redirectUri", redirectUri)
end
	
	
	
function GooglePlayConnectRequest:setSegments(segments)
	self:setAttribute("segments", segments)
end
	
	
	
function GooglePlayConnectRequest:setSwitchIfPossible(switchIfPossible)
	self:setAttribute("switchIfPossible", switchIfPossible)
end
	
	
	
function GooglePlayConnectRequest:setSyncDisplayName(syncDisplayName)
	self:setAttribute("syncDisplayName", syncDisplayName)
end

return GooglePlayConnectRequest
