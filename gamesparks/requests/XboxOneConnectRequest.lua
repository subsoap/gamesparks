local GSRequest = require("gamesparks.GSRequest")
local AuthenticationResponse = require("gamesparks.responses.AuthenticationResponse")

local XboxOneConnectRequest = {}
local XboxOneConnectRequest_mt = {__index = XboxOneConnectRequest}

function XboxOneConnectRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".XboxOneConnectRequest"
  
  return setmetatable(instance, XboxOneConnectRequest_mt)
end

setmetatable(XboxOneConnectRequest, {__index = GSRequest})

function XboxOneConnectRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function XboxOneConnectRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AuthenticationResponse.new(message))
    end
  end)
end

	
function XboxOneConnectRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function XboxOneConnectRequest:setDoNotLinkToCurrentPlayer(doNotLinkToCurrentPlayer)
	self:setAttribute("doNotLinkToCurrentPlayer", doNotLinkToCurrentPlayer)
end
	
	
	
function XboxOneConnectRequest:setErrorOnSwitch(errorOnSwitch)
	self:setAttribute("errorOnSwitch", errorOnSwitch)
end
	
	
	
function XboxOneConnectRequest:setSandbox(sandbox)
	self:setAttribute("sandbox", sandbox)
end
	
	
	
function XboxOneConnectRequest:setSegments(segments)
	self:setAttribute("segments", segments)
end
	
	
	
function XboxOneConnectRequest:setSwitchIfPossible(switchIfPossible)
	self:setAttribute("switchIfPossible", switchIfPossible)
end
	
	
	
function XboxOneConnectRequest:setSyncDisplayName(syncDisplayName)
	self:setAttribute("syncDisplayName", syncDisplayName)
end
	
	
	
function XboxOneConnectRequest:setToken(token)
	self:setAttribute("token", token)
end

return XboxOneConnectRequest
