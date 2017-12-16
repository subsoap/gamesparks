
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local DropTeamResponse = {}
local DropTeamResponse_mt = {__index = DropTeamResponse}

function DropTeamResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, DropTeamResponse_mt)
end

setmetatable(DropTeamResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function DropTeamResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return DropTeamResponse

