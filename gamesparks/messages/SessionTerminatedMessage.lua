
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local SessionTerminatedMessage = {}
local SessionTerminatedMessage_mt = {__index = SessionTerminatedMessage}

function SessionTerminatedMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, SessionTerminatedMessage_mt)
end

setmetatable(SessionTerminatedMessage, {__index = GSResponse})

	
		
-- Used to automatically re-authenticate a client during socket connect.
-- method type 5 - primitive return type
function SessionTerminatedMessage:getAuthToken()
	if self:getAttribute("authToken") ~= nil then
		return self:getAttribute("authToken")
  	end
	
  	return nil
  	
end

return SessionTerminatedMessage

