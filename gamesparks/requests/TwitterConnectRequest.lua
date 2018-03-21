local GSRequest = require("gamesparks.GSRequest")
local AuthenticationResponse = require("gamesparks.responses.AuthenticationResponse")

local TwitterConnectRequest = {}
local TwitterConnectRequest_mt = {__index = TwitterConnectRequest}

function TwitterConnectRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".TwitterConnectRequest"
  
  return setmetatable(instance, TwitterConnectRequest_mt)
end

setmetatable(TwitterConnectRequest, {__index = GSRequest})

function TwitterConnectRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function TwitterConnectRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AuthenticationResponse.new(message))
    end
  end)
end

	
function TwitterConnectRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function TwitterConnectRequest:setAccessSecret(accessSecret)
	self:setAttribute("accessSecret", accessSecret)
end
	
	
	
function TwitterConnectRequest:setAccessToken(accessToken)
	self:setAttribute("accessToken", accessToken)
end
	
	
	
function TwitterConnectRequest:setDoNotLinkToCurrentPlayer(doNotLinkToCurrentPlayer)
	self:setAttribute("doNotLinkToCurrentPlayer", doNotLinkToCurrentPlayer)
end
	
	
	
function TwitterConnectRequest:setErrorOnSwitch(errorOnSwitch)
	self:setAttribute("errorOnSwitch", errorOnSwitch)
end
	
	
	
function TwitterConnectRequest:setSegments(segments)
	self:setAttribute("segments", segments)
end
	
	
	
function TwitterConnectRequest:setSwitchIfPossible(switchIfPossible)
	self:setAttribute("switchIfPossible", switchIfPossible)
end
	
	
	
function TwitterConnectRequest:setSyncDisplayName(syncDisplayName)
	self:setAttribute("syncDisplayName", syncDisplayName)
end

return TwitterConnectRequest
