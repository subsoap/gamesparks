
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local GetMessageResponse = {}
local GetMessageResponse_mt = {__index = GetMessageResponse}

function GetMessageResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, GetMessageResponse_mt)
end

setmetatable(GetMessageResponse, {__index = GSResponse})

	
		
-- The message data
-- method type 5 - primitive return type
function GetMessageResponse:getMessage()
	if self:getAttribute("message") ~= nil then
		return self:getAttribute("message")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function GetMessageResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- The message status
-- method type 5 - primitive return type
function GetMessageResponse:getStatus()
	if self:getAttribute("status") ~= nil then
		return self:getAttribute("status")
  	end
	
  	return nil
  	
end

return GetMessageResponse

