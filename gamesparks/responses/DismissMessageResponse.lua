
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local DismissMessageResponse = {}
local DismissMessageResponse_mt = {__index = DismissMessageResponse}

function DismissMessageResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, DismissMessageResponse_mt)
end

setmetatable(DismissMessageResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function DismissMessageResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return DismissMessageResponse

