
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local ChangeUserDetailsResponse = {}
local ChangeUserDetailsResponse_mt = {__index = ChangeUserDetailsResponse}

function ChangeUserDetailsResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ChangeUserDetailsResponse_mt)
end

setmetatable(ChangeUserDetailsResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ChangeUserDetailsResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return ChangeUserDetailsResponse

