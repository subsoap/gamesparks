local GSRequest = require("gamesparks.GSRequest")
local RegistrationResponse = require("gamesparks.responses.RegistrationResponse")

local RegistrationRequest = {}
local RegistrationRequest_mt = {__index = RegistrationRequest}

function RegistrationRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".RegistrationRequest"
  
  return setmetatable(instance, RegistrationRequest_mt)
end

setmetatable(RegistrationRequest, {__index = GSRequest})

function RegistrationRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function RegistrationRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(RegistrationResponse.new(message))
    end
  end)
end

	
function RegistrationRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function RegistrationRequest:setDisplayName(displayName)
	self:setAttribute("displayName", displayName)
end
	
	
	
function RegistrationRequest:setPassword(password)
	self:setAttribute("password", password)
end
	
	
	
function RegistrationRequest:setSegments(segments)
	self:setAttribute("segments", segments)
end
	
	
	
function RegistrationRequest:setUserName(userName)
	self:setAttribute("userName", userName)
end

return RegistrationRequest
