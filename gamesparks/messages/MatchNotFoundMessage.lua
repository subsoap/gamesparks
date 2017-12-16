
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Participant = require("gamesparks.types.Participant")


local MatchNotFoundMessage = {}
local MatchNotFoundMessage_mt = {__index = MatchNotFoundMessage}

function MatchNotFoundMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, MatchNotFoundMessage_mt)
end

setmetatable(MatchNotFoundMessage, {__index = GSResponse})

	
		
-- MatchData is arbitrary data that can be stored in a Match instance by a Cloud Code script.
-- method type 5 - primitive return type
function MatchNotFoundMessage:getMatchData()
	if self:getAttribute("matchData") ~= nil then
		return self:getAttribute("matchData")
  	end
	
  	return nil
  	
end
		
-- The group the player was assigned in the matchmaking request
-- method type 5 - primitive return type
function MatchNotFoundMessage:getMatchGroup()
	if self:getAttribute("matchGroup") ~= nil then
		return self:getAttribute("matchGroup")
  	end
	
  	return nil
  	
end
		
-- The shortCode of the match type this message for
-- method type 5 - primitive return type
function MatchNotFoundMessage:getMatchShortCode()
	if self:getAttribute("matchShortCode") ~= nil then
		return self:getAttribute("matchShortCode")
  	end
	
  	return nil
  	
end
		
-- A unique identifier for this message.
-- method type 5 - primitive return type
function MatchNotFoundMessage:getMessageId()
	if self:getAttribute("messageId") ~= nil then
		return self:getAttribute("messageId")
  	end
	
  	return nil
  	
end
		
-- Flag indicating whether this message could be sent as a push notification or not.
-- method type 5 - primitive return type
function MatchNotFoundMessage:getNotification()
	if self:getAttribute("notification") ~= nil then
		return self:getAttribute("notification")
  	end
	
  	return false
  	
end
		
-- A JSON Map of any data that was associated to this user
-- method type 5 - primitive return type
function MatchNotFoundMessage:getParticipantData()
	if self:getAttribute("participantData") ~= nil then
		return self:getAttribute("participantData")
  	end
	
  	return nil
  	
end
		
-- The participants in this match
-- method type 1 - typed object array return type
function MatchNotFoundMessage:getParticipants()
	local ret = {}
	local participants = self:getAttribute("participants")
	
	if participants ~= nil then
		for a = 1, #participants do
	    	ret[a] = Participant.new(participants[a])
	    end
	end
	  
	return ret
end
			
		
-- ScriptData is arbitrary data that can be stored in a message by a Cloud Code script.
-- method type 5 - primitive return type
function MatchNotFoundMessage:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function MatchNotFoundMessage:getSubTitle()
	if self:getAttribute("subTitle") ~= nil then
		return self:getAttribute("subTitle")
  	end
	
  	return nil
  	
end
		
-- A textual summary describing the message's purpose.
-- method type 5 - primitive return type
function MatchNotFoundMessage:getSummary()
	if self:getAttribute("summary") ~= nil then
		return self:getAttribute("summary")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function MatchNotFoundMessage:getTitle()
	if self:getAttribute("title") ~= nil then
		return self:getAttribute("title")
  	end
	
  	return nil
  	
end

return MatchNotFoundMessage

