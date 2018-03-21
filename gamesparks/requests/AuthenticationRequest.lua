local GSRequest = require("gamesparks.GSRequest")
local AuthenticationResponse = require("gamesparks.responses.AuthenticationResponse")

local AuthenticationRequest = {}
local AuthenticationRequest_mt = {__index = AuthenticationRequest}

function AuthenticationRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".AuthenticationRequest"
  
  return setmetatable(instance, AuthenticationRequest_mt)
end

setmetatable(AuthenticationRequest, {__index = GSRequest})

function AuthenticationRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function AuthenticationRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AuthenticationResponse.new(message))
    end
  end)
end

	
function AuthenticationRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function AuthenticationRequest:setPassword(password)
	self:setAttribute("password", password)
end
	
	
	
function AuthenticationRequest:setUserName(userName)
	self:setAttribute("userName", userName)
end

return AuthenticationRequest
