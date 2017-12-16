
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local DismissMultipleMessagesResponse = {}
local DismissMultipleMessagesResponse_mt = {__index = DismissMultipleMessagesResponse}

function DismissMultipleMessagesResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, DismissMultipleMessagesResponse_mt)
end

setmetatable(DismissMultipleMessagesResponse, {__index = GSResponse})

	
		
-- A list of the messageId values that were not dismissed
-- method type 4 - primitive array return type
function DismissMultipleMessagesResponse:getFailedDismissals()
	local ret = {}
	local failedDismissals = self:getAttribute("failedDismissals")
	
	if failedDismissals ~= nil then
		for a = 1, #failedDismissals do
	    	ret[a] = failedDismissals[a]
	    end
	end
	  
	return ret
end
		
-- An integer describing how many messages were dismissed
-- method type 5 - primitive return type
function DismissMultipleMessagesResponse:getMessagesDismissed()
	if self:getAttribute("messagesDismissed") ~= nil then
		return self:getAttribute("messagesDismissed")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function DismissMultipleMessagesResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return DismissMultipleMessagesResponse

