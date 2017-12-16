
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local ChatMessage = {}
local ChatMessage_mt = {__index = ChatMessage}

function ChatMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ChatMessage_mt)
end

setmetatable(ChatMessage, {__index = GSResponse})

	
		
-- The id of the player who sent this message
-- method type 5 - primitive return type
function ChatMessage:getFromId()
	if self:getAttribute("fromId") ~= nil then
		return self:getAttribute("fromId")
  	end
	
  	return nil
  	
end
		
-- The id of this chat message
-- method type 5 - primitive return type
function ChatMessage:getId()
	if self:getAttribute("id") ~= nil then
		return self:getAttribute("id")
  	end
	
  	return nil
  	
end
		
-- The text sent in this message
-- method type 5 - primitive return type
function ChatMessage:getMessage()
	if self:getAttribute("message") ~= nil then
		return self:getAttribute("message")
  	end
	
  	return nil
  	
end
		
-- A date representing the time this message was sent
-- method type 5 - primitive return type
function ChatMessage:getWhen()
	if self:getAttribute("when") ~= nil then
		return rfc3339toDate(self:getAttribute("when"));
  	end
	
  	return nil
  	
end
		
-- The displayName of the player who sent this message
-- method type 5 - primitive return type
function ChatMessage:getWho()
	if self:getAttribute("who") ~= nil then
		return self:getAttribute("who")
  	end
	
  	return nil
  	
end

return ChatMessage

