
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local PlayerMessage = require("gamesparks.types.PlayerMessage")


local ListMessageDetailResponse = {}
local ListMessageDetailResponse_mt = {__index = ListMessageDetailResponse}

function ListMessageDetailResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ListMessageDetailResponse_mt)
end

setmetatable(ListMessageDetailResponse, {__index = GSResponse})

	
		
-- A list of JSON objects containing player messages
-- method type 1 - typed object array return type
function ListMessageDetailResponse:getMessageList()
	local ret = {}
	local messageList = self:getAttribute("messageList")
	
	if messageList ~= nil then
		for a = 1, #messageList do
	    	ret[a] = PlayerMessage.new(messageList[a])
	    end
	end
	  
	return ret
end
			
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ListMessageDetailResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return ListMessageDetailResponse

