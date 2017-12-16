
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local PushRegistrationResponse = {}
local PushRegistrationResponse_mt = {__index = PushRegistrationResponse}

function PushRegistrationResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, PushRegistrationResponse_mt)
end

setmetatable(PushRegistrationResponse, {__index = GSResponse})

	
		
-- An identifier for the successful registration.  Clients should store this value to be used in the event the player no longer wants to receive push notifications to this device.
-- method type 5 - primitive return type
function PushRegistrationResponse:getRegistrationId()
	if self:getAttribute("registrationId") ~= nil then
		return self:getAttribute("registrationId")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function PushRegistrationResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return PushRegistrationResponse

