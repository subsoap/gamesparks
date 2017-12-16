
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local GetDownloadableResponse = {}
local GetDownloadableResponse_mt = {__index = GetDownloadableResponse}

function GetDownloadableResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, GetDownloadableResponse_mt)
end

setmetatable(GetDownloadableResponse, {__index = GSResponse})

	
		
-- The date when the downloadable item was last modified
-- method type 5 - primitive return type
function GetDownloadableResponse:getLastModified()
	if self:getAttribute("lastModified") ~= nil then
		return rfc3339toDate(self:getAttribute("lastModified"));
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function GetDownloadableResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- The short code of the item
-- method type 5 - primitive return type
function GetDownloadableResponse:getShortCode()
	if self:getAttribute("shortCode") ~= nil then
		return self:getAttribute("shortCode")
  	end
	
  	return nil
  	
end
		
-- The size of the item in bytes
-- method type 5 - primitive return type
function GetDownloadableResponse:getSize()
	if self:getAttribute("size") ~= nil then
		return self:getAttribute("size")
  	end
	
  	return nil
  	
end
		
-- The download URL
-- method type 5 - primitive return type
function GetDownloadableResponse:getUrl()
	if self:getAttribute("url") ~= nil then
		return self:getAttribute("url")
  	end
	
  	return nil
  	
end

return GetDownloadableResponse

