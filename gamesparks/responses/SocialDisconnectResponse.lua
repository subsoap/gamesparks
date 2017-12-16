
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local SocialDisconnectResponse = {}
local SocialDisconnectResponse_mt = {__index = SocialDisconnectResponse}

function SocialDisconnectResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, SocialDisconnectResponse_mt)
end

setmetatable(SocialDisconnectResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function SocialDisconnectResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return SocialDisconnectResponse

