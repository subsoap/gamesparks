
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local ListMessageResponse = {}
local ListMessageResponse_mt = {__index = ListMessageResponse}

function ListMessageResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ListMessageResponse_mt)
end

setmetatable(ListMessageResponse, {__index = GSResponse})

	
		
-- A list of JSON objects containing player messages
		
-- method type 3 - map return type
function ListMessageResponse:getMessageList()
	if self:getAttribute("messageList") ~= nil then
    	return self:getAttribute("messageList")
  	end
  
  	return nil
end
		
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ListMessageResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return ListMessageResponse

