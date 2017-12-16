
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local SendTeamChatMessageResponse = {}
local SendTeamChatMessageResponse_mt = {__index = SendTeamChatMessageResponse}

function SendTeamChatMessageResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, SendTeamChatMessageResponse_mt)
end

setmetatable(SendTeamChatMessageResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function SendTeamChatMessageResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return SendTeamChatMessageResponse

