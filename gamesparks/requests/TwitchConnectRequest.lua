local GSRequest = require("gamesparks.GSRequest")
local AuthenticationResponse = require("gamesparks.responses.AuthenticationResponse")

local TwitchConnectRequest = {}
local TwitchConnectRequest_mt = {__index = TwitchConnectRequest}

function TwitchConnectRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".TwitchConnectRequest"
  
  return setmetatable(instance, TwitchConnectRequest_mt)
end

setmetatable(TwitchConnectRequest, {__index = GSRequest})

function TwitchConnectRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function TwitchConnectRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AuthenticationResponse.new(message))
    end
  end)
end

	
function TwitchConnectRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function TwitchConnectRequest:setAccessToken(accessToken)
	self:setAttribute("accessToken", accessToken)
end
	
	
	
function TwitchConnectRequest:setDoNotLinkToCurrentPlayer(doNotLinkToCurrentPlayer)
	self:setAttribute("doNotLinkToCurrentPlayer", doNotLinkToCurrentPlayer)
end
	
	
	
function TwitchConnectRequest:setErrorOnSwitch(errorOnSwitch)
	self:setAttribute("errorOnSwitch", errorOnSwitch)
end
	
	
	
function TwitchConnectRequest:setSegments(segments)
	self:setAttribute("segments", segments)
end
	
	
	
function TwitchConnectRequest:setSwitchIfPossible(switchIfPossible)
	self:setAttribute("switchIfPossible", switchIfPossible)
end
	
	
	
function TwitchConnectRequest:setSyncDisplayName(syncDisplayName)
	self:setAttribute("syncDisplayName", syncDisplayName)
end

return TwitchConnectRequest
