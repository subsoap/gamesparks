local GSRequest = require("gamesparks.GSRequest")
local AuthenticationResponse = require("gamesparks.responses.AuthenticationResponse")

local FacebookConnectRequest = {}
local FacebookConnectRequest_mt = {__index = FacebookConnectRequest}

function FacebookConnectRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".FacebookConnectRequest"
  
  return setmetatable(instance, FacebookConnectRequest_mt)
end

setmetatable(FacebookConnectRequest, {__index = GSRequest})

function FacebookConnectRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function FacebookConnectRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AuthenticationResponse.new(message))
    end
  end)
end

	
function FacebookConnectRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function FacebookConnectRequest:setAccessToken(accessToken)
	self:setAttribute("accessToken", accessToken)
end
	
	
	
function FacebookConnectRequest:setCode(code)
	self:setAttribute("code", code)
end
	
	
	
function FacebookConnectRequest:setDoNotLinkToCurrentPlayer(doNotLinkToCurrentPlayer)
	self:setAttribute("doNotLinkToCurrentPlayer", doNotLinkToCurrentPlayer)
end
	
	
	
function FacebookConnectRequest:setErrorOnSwitch(errorOnSwitch)
	self:setAttribute("errorOnSwitch", errorOnSwitch)
end
	
	
	
function FacebookConnectRequest:setSegments(segments)
	self:setAttribute("segments", segments)
end
	
	
	
function FacebookConnectRequest:setSwitchIfPossible(switchIfPossible)
	self:setAttribute("switchIfPossible", switchIfPossible)
end
	
	
	
function FacebookConnectRequest:setSyncDisplayName(syncDisplayName)
	self:setAttribute("syncDisplayName", syncDisplayName)
end

return FacebookConnectRequest
