
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local ListMessageSummaryResponse = {}
local ListMessageSummaryResponse_mt = {__index = ListMessageSummaryResponse}

function ListMessageSummaryResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ListMessageSummaryResponse_mt)
end

setmetatable(ListMessageSummaryResponse, {__index = GSResponse})

	
		
-- A list of JSON objects containing player message summaries
		
-- method type 3 - map return type
function ListMessageSummaryResponse:getMessageList()
	if self:getAttribute("messageList") ~= nil then
    	return self:getAttribute("messageList")
  	end
  
  	return nil
end
		
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ListMessageSummaryResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return ListMessageSummaryResponse

