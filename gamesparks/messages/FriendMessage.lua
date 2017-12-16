
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local FriendMessage = {}
local FriendMessage_mt = {__index = FriendMessage}

function FriendMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, FriendMessage_mt)
end

setmetatable(FriendMessage, {__index = GSResponse})

	
		
-- The player's id who is sending the message.
-- method type 5 - primitive return type
function FriendMessage:getFromId()
	if self:getAttribute("fromId") ~= nil then
		return self:getAttribute("fromId")
  	end
	
  	return nil
  	
end
		
-- The player's message.
-- method type 5 - primitive return type
function FriendMessage:getMessage()
	if self:getAttribute("message") ~= nil then
		return self:getAttribute("message")
  	end
	
  	return nil
  	
end
		
-- A unique identifier for this message.
-- method type 5 - primitive return type
function FriendMessage:getMessageId()
	if self:getAttribute("messageId") ~= nil then
		return self:getAttribute("messageId")
  	end
	
  	return nil
  	
end
		
-- Flag indicating whether this message could be sent as a push notification or not.
-- method type 5 - primitive return type
function FriendMessage:getNotification()
	if self:getAttribute("notification") ~= nil then
		return self:getAttribute("notification")
  	end
	
  	return false
  	
end
		
-- ScriptData is arbitrary data that can be stored in a message by a Cloud Code script.
-- method type 5 - primitive return type
function FriendMessage:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function FriendMessage:getSubTitle()
	if self:getAttribute("subTitle") ~= nil then
		return self:getAttribute("subTitle")
  	end
	
  	return nil
  	
end
		
-- A textual summary describing the message's purpose.
-- method type 5 - primitive return type
function FriendMessage:getSummary()
	if self:getAttribute("summary") ~= nil then
		return self:getAttribute("summary")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function FriendMessage:getTitle()
	if self:getAttribute("title") ~= nil then
		return self:getAttribute("title")
  	end
	
  	return nil
  	
end
		
-- The name of the player who is sending the message.
-- method type 5 - primitive return type
function FriendMessage:getWho()
	if self:getAttribute("who") ~= nil then
		return self:getAttribute("who")
  	end
	
  	return nil
  	
end

return FriendMessage

