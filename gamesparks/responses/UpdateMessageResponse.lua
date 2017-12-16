
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local UpdateMessageResponse = {}
local UpdateMessageResponse_mt = {__index = UpdateMessageResponse}

function UpdateMessageResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, UpdateMessageResponse_mt)
end

setmetatable(UpdateMessageResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function UpdateMessageResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return UpdateMessageResponse

