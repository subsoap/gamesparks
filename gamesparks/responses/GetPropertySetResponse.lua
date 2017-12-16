
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local GetPropertySetResponse = {}
local GetPropertySetResponse_mt = {__index = GetPropertySetResponse}

function GetPropertySetResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, GetPropertySetResponse_mt)
end

setmetatable(GetPropertySetResponse, {__index = GSResponse})

	
		
-- The property set
-- method type 5 - primitive return type
function GetPropertySetResponse:getPropertySet()
	if self:getAttribute("propertySet") ~= nil then
		return self:getAttribute("propertySet")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function GetPropertySetResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return GetPropertySetResponse

