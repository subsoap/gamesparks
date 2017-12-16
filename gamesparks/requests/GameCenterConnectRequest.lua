local GSRequest = require("gamesparks.GSRequest")
local AuthenticationResponse = require("gamesparks.responses.AuthenticationResponse")

local GameCenterConnectRequest = {}
local GameCenterConnectRequest_mt = {__index = GameCenterConnectRequest}

function GameCenterConnectRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".GameCenterConnectRequest"
  
  return setmetatable(instance, GameCenterConnectRequest_mt)
end

setmetatable(GameCenterConnectRequest, {__index = GSRequest})

function GameCenterConnectRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function GameCenterConnectRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AuthenticationResponse.new(message))
    end
  end)
end

	
function GameCenterConnectRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function GameCenterConnectRequest:setDisplayName(displayName)
	self:setAttribute("displayName", displayName)
end
	
	
	
function GameCenterConnectRequest:setDoNotLinkToCurrentPlayer(doNotLinkToCurrentPlayer)
	self:setAttribute("doNotLinkToCurrentPlayer", doNotLinkToCurrentPlayer)
end
	
	
	
function GameCenterConnectRequest:setErrorOnSwitch(errorOnSwitch)
	self:setAttribute("errorOnSwitch", errorOnSwitch)
end
	
	
	
function GameCenterConnectRequest:setExternalPlayerId(externalPlayerId)
	self:setAttribute("externalPlayerId", externalPlayerId)
end
	
	
	
function GameCenterConnectRequest:setPublicKeyUrl(publicKeyUrl)
	self:setAttribute("publicKeyUrl", publicKeyUrl)
end
	
	
	
function GameCenterConnectRequest:setSalt(salt)
	self:setAttribute("salt", salt)
end
	
	
	
function GameCenterConnectRequest:setSegments(segments)
	self:setAttribute("segments", segments)
end
	
	
	
function GameCenterConnectRequest:setSignature(signature)
	self:setAttribute("signature", signature)
end
	
	
	
function GameCenterConnectRequest:setSwitchIfPossible(switchIfPossible)
	self:setAttribute("switchIfPossible", switchIfPossible)
end
	
	
	
function GameCenterConnectRequest:setSyncDisplayName(syncDisplayName)
	self:setAttribute("syncDisplayName", syncDisplayName)
end
	
	
	
function GameCenterConnectRequest:setTimestamp(timestamp)
	self:setAttribute("timestamp", timestamp)
end

return GameCenterConnectRequest
