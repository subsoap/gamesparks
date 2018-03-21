local GSRequest = require("gamesparks.GSRequest")
local AuthenticationResponse = require("gamesparks.responses.AuthenticationResponse")

local GooglePlusConnectRequest = {}
local GooglePlusConnectRequest_mt = {__index = GooglePlusConnectRequest}

function GooglePlusConnectRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".GooglePlusConnectRequest"
  
  return setmetatable(instance, GooglePlusConnectRequest_mt)
end

setmetatable(GooglePlusConnectRequest, {__index = GSRequest})

function GooglePlusConnectRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function GooglePlusConnectRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AuthenticationResponse.new(message))
    end
  end)
end

	
function GooglePlusConnectRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function GooglePlusConnectRequest:setAccessToken(accessToken)
	self:setAttribute("accessToken", accessToken)
end
	
	
	
function GooglePlusConnectRequest:setCode(code)
	self:setAttribute("code", code)
end
	
	
	
function GooglePlusConnectRequest:setDoNotLinkToCurrentPlayer(doNotLinkToCurrentPlayer)
	self:setAttribute("doNotLinkToCurrentPlayer", doNotLinkToCurrentPlayer)
end
	
	
	
function GooglePlusConnectRequest:setErrorOnSwitch(errorOnSwitch)
	self:setAttribute("errorOnSwitch", errorOnSwitch)
end
	
	
	
function GooglePlusConnectRequest:setRedirectUri(redirectUri)
	self:setAttribute("redirectUri", redirectUri)
end
	
	
	
function GooglePlusConnectRequest:setSegments(segments)
	self:setAttribute("segments", segments)
end
	
	
	
function GooglePlusConnectRequest:setSwitchIfPossible(switchIfPossible)
	self:setAttribute("switchIfPossible", switchIfPossible)
end
	
	
	
function GooglePlusConnectRequest:setSyncDisplayName(syncDisplayName)
	self:setAttribute("syncDisplayName", syncDisplayName)
end

return GooglePlusConnectRequest
