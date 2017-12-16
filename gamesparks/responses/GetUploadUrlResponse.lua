
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local GetUploadUrlResponse = {}
local GetUploadUrlResponse_mt = {__index = GetUploadUrlResponse}

function GetUploadUrlResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, GetUploadUrlResponse_mt)
end

setmetatable(GetUploadUrlResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function GetUploadUrlResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- The time sensitive upload URL
-- method type 5 - primitive return type
function GetUploadUrlResponse:getUrl()
	if self:getAttribute("url") ~= nil then
		return self:getAttribute("url")
  	end
	
  	return nil
  	
end

return GetUploadUrlResponse

