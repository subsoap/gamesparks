
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local TeamChatMessage = {}
local TeamChatMessage_mt = {__index = TeamChatMessage}

function TeamChatMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, TeamChatMessage_mt)
end

setmetatable(TeamChatMessage, {__index = GSResponse})

	
		
-- The identifier for this message as it appears in the chat history.
-- method type 5 - primitive return type
function TeamChatMessage:getChatMessageId()
	if self:getAttribute("chatMessageId") ~= nil then
		return self:getAttribute("chatMessageId")
  	end
	
  	return nil
  	
end
		
-- The player's id who is sending the message.
-- method type 5 - primitive return type
function TeamChatMessage:getFromId()
	if self:getAttribute("fromId") ~= nil then
		return self:getAttribute("fromId")
  	end
	
  	return nil
  	
end
		
-- The message to send to the team.
-- method type 5 - primitive return type
function TeamChatMessage:getMessage()
	if self:getAttribute("message") ~= nil then
		return self:getAttribute("message")
  	end
	
  	return nil
  	
end
		
-- A unique identifier for this message.
-- method type 5 - primitive return type
function TeamChatMessage:getMessageId()
	if self:getAttribute("messageId") ~= nil then
		return self:getAttribute("messageId")
  	end
	
  	return nil
  	
end
		
-- Flag indicating whether this message could be sent as a push notification or not.
-- method type 5 - primitive return type
function TeamChatMessage:getNotification()
	if self:getAttribute("notification") ~= nil then
		return self:getAttribute("notification")
  	end
	
  	return false
  	
end
		
-- The id of the owner
-- method type 5 - primitive return type
function TeamChatMessage:getOwnerId()
	if self:getAttribute("ownerId") ~= nil then
		return self:getAttribute("ownerId")
  	end
	
  	return nil
  	
end
		
-- ScriptData is arbitrary data that can be stored in a message by a Cloud Code script.
-- method type 5 - primitive return type
function TeamChatMessage:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function TeamChatMessage:getSubTitle()
	if self:getAttribute("subTitle") ~= nil then
		return self:getAttribute("subTitle")
  	end
	
  	return nil
  	
end
		
-- A textual summary describing the message's purpose.
-- method type 5 - primitive return type
function TeamChatMessage:getSummary()
	if self:getAttribute("summary") ~= nil then
		return self:getAttribute("summary")
  	end
	
  	return nil
  	
end
		
-- The id of the team
-- method type 5 - primitive return type
function TeamChatMessage:getTeamId()
	if self:getAttribute("teamId") ~= nil then
		return self:getAttribute("teamId")
  	end
	
  	return nil
  	
end
		
-- The team type
-- method type 5 - primitive return type
function TeamChatMessage:getTeamType()
	if self:getAttribute("teamType") ~= nil then
		return self:getAttribute("teamType")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function TeamChatMessage:getTitle()
	if self:getAttribute("title") ~= nil then
		return self:getAttribute("title")
  	end
	
  	return nil
  	
end
		
-- The name of the player who is sending the message.
-- method type 5 - primitive return type
function TeamChatMessage:getWho()
	if self:getAttribute("who") ~= nil then
		return self:getAttribute("who")
  	end
	
  	return nil
  	
end

return TeamChatMessage

