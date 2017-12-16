
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local GetPropertyResponse = {}
local GetPropertyResponse_mt = {__index = GetPropertyResponse}

function GetPropertyResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, GetPropertyResponse_mt)
end

setmetatable(GetPropertyResponse, {__index = GSResponse})

	
		
-- The property value
-- method type 5 - primitive return type
function GetPropertyResponse:getProperty()
	if self:getAttribute("property") ~= nil then
		return self:getAttribute("property")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function GetPropertyResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return GetPropertyResponse

