local GSRequest = require("gamesparks.GSRequest")
local PushRegistrationResponse = require("gamesparks.responses.PushRegistrationResponse")

local PushRegistrationRequest = {}
local PushRegistrationRequest_mt = {__index = PushRegistrationRequest}

function PushRegistrationRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".PushRegistrationRequest"
  
  return setmetatable(instance, PushRegistrationRequest_mt)
end

setmetatable(PushRegistrationRequest, {__index = GSRequest})

function PushRegistrationRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function PushRegistrationRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(PushRegistrationResponse.new(message))
    end
  end)
end

	
function PushRegistrationRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function PushRegistrationRequest:setDeviceOS(deviceOS)
	self:setAttribute("deviceOS", deviceOS)
end
	
	
	
function PushRegistrationRequest:setPushId(pushId)
	self:setAttribute("pushId", pushId)
end

return PushRegistrationRequest
