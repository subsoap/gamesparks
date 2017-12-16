
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local ChatMessage = require("gamesparks.types.ChatMessage")


local ListTeamChatResponse = {}
local ListTeamChatResponse_mt = {__index = ListTeamChatResponse}

function ListTeamChatResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ListTeamChatResponse_mt)
end

setmetatable(ListTeamChatResponse, {__index = GSResponse})

	
		
-- The collection of team chat messages
-- method type 1 - typed object array return type
function ListTeamChatResponse:getMessages()
	local ret = {}
	local messages = self:getAttribute("messages")
	
	if messages ~= nil then
		for a = 1, #messages do
	    	ret[a] = ChatMessage.new(messages[a])
	    end
	end
	  
	return ret
end
			
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ListTeamChatResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return ListTeamChatResponse

