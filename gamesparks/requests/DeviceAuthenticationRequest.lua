local GSRequest = require("gamesparks.GSRequest")
local AuthenticationResponse = require("gamesparks.responses.AuthenticationResponse")

local DeviceAuthenticationRequest = {}
local DeviceAuthenticationRequest_mt = {__index = DeviceAuthenticationRequest}

function DeviceAuthenticationRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".DeviceAuthenticationRequest"
  
  return setmetatable(instance, DeviceAuthenticationRequest_mt)
end

setmetatable(DeviceAuthenticationRequest, {__index = GSRequest})

function DeviceAuthenticationRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function DeviceAuthenticationRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AuthenticationResponse.new(message))
    end
  end)
end

	
function DeviceAuthenticationRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function DeviceAuthenticationRequest:setDeviceId(deviceId)
	self:setAttribute("deviceId", deviceId)
end
	
	
	
function DeviceAuthenticationRequest:setDeviceModel(deviceModel)
	self:setAttribute("deviceModel", deviceModel)
end
	
	
	
function DeviceAuthenticationRequest:setDeviceName(deviceName)
	self:setAttribute("deviceName", deviceName)
end
	
	
	
function DeviceAuthenticationRequest:setDeviceOS(deviceOS)
	self:setAttribute("deviceOS", deviceOS)
end
	
	
	
function DeviceAuthenticationRequest:setDeviceType(deviceType)
	self:setAttribute("deviceType", deviceType)
end
	
	
	
function DeviceAuthenticationRequest:setDisplayName(displayName)
	self:setAttribute("displayName", displayName)
end
	
	
	
function DeviceAuthenticationRequest:setOperatingSystem(operatingSystem)
	self:setAttribute("operatingSystem", operatingSystem)
end
	
	
	
function DeviceAuthenticationRequest:setSegments(segments)
	self:setAttribute("segments", segments)
end

return DeviceAuthenticationRequest
