local GSRequest = require("gamesparks.GSRequest")
local AuthenticationResponse = require("gamesparks.responses.AuthenticationResponse")

local NXConnectRequest = {}
local NXConnectRequest_mt = {__index = NXConnectRequest}

function NXConnectRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".NXConnectRequest"
  
  return setmetatable(instance, NXConnectRequest_mt)
end

setmetatable(NXConnectRequest, {__index = GSRequest})

function NXConnectRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function NXConnectRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AuthenticationResponse.new(message))
    end
  end)
end

	
function NXConnectRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function NXConnectRequest:setAccountPerLoginId(accountPerLoginId)
	self:setAttribute("accountPerLoginId", accountPerLoginId)
end
	
	
	
function NXConnectRequest:setDisplayName(displayName)
	self:setAttribute("displayName", displayName)
end
	
	
	
function NXConnectRequest:setDoNotLinkToCurrentPlayer(doNotLinkToCurrentPlayer)
	self:setAttribute("doNotLinkToCurrentPlayer", doNotLinkToCurrentPlayer)
end
	
	
	
function NXConnectRequest:setErrorOnSwitch(errorOnSwitch)
	self:setAttribute("errorOnSwitch", errorOnSwitch)
end
	
	
	
function NXConnectRequest:setNsaIdToken(nsaIdToken)
	self:setAttribute("nsaIdToken", nsaIdToken)
end
	
	
	
function NXConnectRequest:setSegments(segments)
	self:setAttribute("segments", segments)
end
	
	
	
function NXConnectRequest:setSwitchIfPossible(switchIfPossible)
	self:setAttribute("switchIfPossible", switchIfPossible)
end
	
	
	
function NXConnectRequest:setSyncDisplayName(syncDisplayName)
	self:setAttribute("syncDisplayName", syncDisplayName)
end

return NXConnectRequest
