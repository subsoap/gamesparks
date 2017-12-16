
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Player = require("gamesparks.types.Player")


local AuthenticationResponse = {}
local AuthenticationResponse_mt = {__index = AuthenticationResponse}

function AuthenticationResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, AuthenticationResponse_mt)
end

setmetatable(AuthenticationResponse, {__index = GSResponse})

	
		
-- 44b297a8-162a-4220-8c14-dad9a1946ad2
-- method type 5 - primitive return type
function AuthenticationResponse:getAuthToken()
	if self:getAttribute("authToken") ~= nil then
		return self:getAttribute("authToken")
  	end
	
  	return nil
  	
end
		
-- The player's display name
-- method type 5 - primitive return type
function AuthenticationResponse:getDisplayName()
	if self:getAttribute("displayName") ~= nil then
		return self:getAttribute("displayName")
  	end
	
  	return nil
  	
end
		
-- Indicates whether the player was created as part of this request
-- method type 5 - primitive return type
function AuthenticationResponse:getNewPlayer()
	if self:getAttribute("newPlayer") ~= nil then
		return self:getAttribute("newPlayer")
  	end
	
  	return false
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function AuthenticationResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A summary of the player that would be switched to.  Only returned as part of an error response for a request where automatic switching is disabled.
-- method type 2 - typed object return type
function AuthenticationResponse:getSwitchSummary()
	if self:getAttribute("switchSummary") ~= nil then
		return Player.new(self:getAttribute("switchSummary"))
	end
	  
	return nil
end		
				
		
-- The player's id
-- method type 5 - primitive return type
function AuthenticationResponse:getUserId()
	if self:getAttribute("userId") ~= nil then
		return self:getAttribute("userId")
  	end
	
  	return nil
  	
end

return AuthenticationResponse

