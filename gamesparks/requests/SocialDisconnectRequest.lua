local GSRequest = require("gamesparks.GSRequest")
local SocialDisconnectResponse = require("gamesparks.responses.SocialDisconnectResponse")

local SocialDisconnectRequest = {}
local SocialDisconnectRequest_mt = {__index = SocialDisconnectRequest}

function SocialDisconnectRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".SocialDisconnectRequest"
  
  return setmetatable(instance, SocialDisconnectRequest_mt)
end

setmetatable(SocialDisconnectRequest, {__index = GSRequest})

function SocialDisconnectRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function SocialDisconnectRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(SocialDisconnectResponse.new(message))
    end
  end)
end

	
function SocialDisconnectRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function SocialDisconnectRequest:setSystemId(systemId)
	self:setAttribute("systemId", systemId)
end

return SocialDisconnectRequest
