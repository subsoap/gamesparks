
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local GetUploadedResponse = {}
local GetUploadedResponse_mt = {__index = GetUploadedResponse}

function GetUploadedResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, GetUploadedResponse_mt)
end

setmetatable(GetUploadedResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function GetUploadedResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- The size of the file in bytes
-- method type 5 - primitive return type
function GetUploadedResponse:getSize()
	if self:getAttribute("size") ~= nil then
		return self:getAttribute("size")
  	end
	
  	return nil
  	
end
		
-- A time sensitive URL to a piece of content
-- method type 5 - primitive return type
function GetUploadedResponse:getUrl()
	if self:getAttribute("url") ~= nil then
		return self:getAttribute("url")
  	end
	
  	return nil
  	
end

return GetUploadedResponse

