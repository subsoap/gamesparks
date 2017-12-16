local GSRequest = require("gamesparks.GSRequest")
local AuthenticationResponse = require("gamesparks.responses.AuthenticationResponse")

local XBOXLiveConnectRequest = {}
local XBOXLiveConnectRequest_mt = {__index = XBOXLiveConnectRequest}

function XBOXLiveConnectRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".XBOXLiveConnectRequest"
  
  return setmetatable(instance, XBOXLiveConnectRequest_mt)
end

setmetatable(XBOXLiveConnectRequest, {__index = GSRequest})

function XBOXLiveConnectRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function XBOXLiveConnectRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AuthenticationResponse.new(message))
    end
  end)
end

	
function XBOXLiveConnectRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function XBOXLiveConnectRequest:setDisplayName(displayName)
	self:setAttribute("displayName", displayName)
end
	
	
	
function XBOXLiveConnectRequest:setDoNotLinkToCurrentPlayer(doNotLinkToCurrentPlayer)
	self:setAttribute("doNotLinkToCurrentPlayer", doNotLinkToCurrentPlayer)
end
	
	
	
function XBOXLiveConnectRequest:setErrorOnSwitch(errorOnSwitch)
	self:setAttribute("errorOnSwitch", errorOnSwitch)
end
	
	
	
function XBOXLiveConnectRequest:setSegments(segments)
	self:setAttribute("segments", segments)
end
	
	
	
function XBOXLiveConnectRequest:setStsTokenString(stsTokenString)
	self:setAttribute("stsTokenString", stsTokenString)
end
	
	
	
function XBOXLiveConnectRequest:setSwitchIfPossible(switchIfPossible)
	self:setAttribute("switchIfPossible", switchIfPossible)
end
	
	
	
function XBOXLiveConnectRequest:setSyncDisplayName(syncDisplayName)
	self:setAttribute("syncDisplayName", syncDisplayName)
end

return XBOXLiveConnectRequest
