
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Participant = require("gamesparks.types.Participant")


local MatchUpdatedMessage = {}
local MatchUpdatedMessage_mt = {__index = MatchUpdatedMessage}

function MatchUpdatedMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, MatchUpdatedMessage_mt)
end

setmetatable(MatchUpdatedMessage, {__index = GSResponse})

	
		
-- The players that joined this match
-- method type 4 - primitive array return type
function MatchUpdatedMessage:getAddedPlayers()
	local ret = {}
	local addedPlayers = self:getAttribute("addedPlayers")
	
	if addedPlayers ~= nil then
		for a = 1, #addedPlayers do
	    	ret[a] = addedPlayers[a]
	    end
	end
	  
	return ret
end
		
-- MatchData is arbitrary data that can be stored in a Match instance by a Cloud Code script.
-- method type 5 - primitive return type
function MatchUpdatedMessage:getMatchData()
	if self:getAttribute("matchData") ~= nil then
		return self:getAttribute("matchData")
  	end
	
  	return nil
  	
end
		
-- The group the player was assigned in the matchmaking request
-- method type 5 - primitive return type
function MatchUpdatedMessage:getMatchGroup()
	if self:getAttribute("matchGroup") ~= nil then
		return self:getAttribute("matchGroup")
  	end
	
  	return nil
  	
end
		
-- The id for this match instance
-- method type 5 - primitive return type
function MatchUpdatedMessage:getMatchId()
	if self:getAttribute("matchId") ~= nil then
		return self:getAttribute("matchId")
  	end
	
  	return nil
  	
end
		
-- The shortCode of the match type this message for
-- method type 5 - primitive return type
function MatchUpdatedMessage:getMatchShortCode()
	if self:getAttribute("matchShortCode") ~= nil then
		return self:getAttribute("matchShortCode")
  	end
	
  	return nil
  	
end
		
-- A unique identifier for this message.
-- method type 5 - primitive return type
function MatchUpdatedMessage:getMessageId()
	if self:getAttribute("messageId") ~= nil then
		return self:getAttribute("messageId")
  	end
	
  	return nil
  	
end
		
-- Flag indicating whether this message could be sent as a push notification or not.
-- method type 5 - primitive return type
function MatchUpdatedMessage:getNotification()
	if self:getAttribute("notification") ~= nil then
		return self:getAttribute("notification")
  	end
	
  	return false
  	
end
		
-- The participants in this match
-- method type 1 - typed object array return type
function MatchUpdatedMessage:getParticipants()
	local ret = {}
	local participants = self:getAttribute("participants")
	
	if participants ~= nil then
		for a = 1, #participants do
	    	ret[a] = Participant.new(participants[a])
	    end
	end
	  
	return ret
end
			
		
-- The players that left this match
-- method type 4 - primitive array return type
function MatchUpdatedMessage:getRemovedPlayers()
	local ret = {}
	local removedPlayers = self:getAttribute("removedPlayers")
	
	if removedPlayers ~= nil then
		for a = 1, #removedPlayers do
	    	ret[a] = removedPlayers[a]
	    end
	end
	  
	return ret
end
		
-- ScriptData is arbitrary data that can be stored in a message by a Cloud Code script.
-- method type 5 - primitive return type
function MatchUpdatedMessage:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function MatchUpdatedMessage:getSubTitle()
	if self:getAttribute("subTitle") ~= nil then
		return self:getAttribute("subTitle")
  	end
	
  	return nil
  	
end
		
-- A textual summary describing the message's purpose.
-- method type 5 - primitive return type
function MatchUpdatedMessage:getSummary()
	if self:getAttribute("summary") ~= nil then
		return self:getAttribute("summary")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function MatchUpdatedMessage:getTitle()
	if self:getAttribute("title") ~= nil then
		return self:getAttribute("title")
  	end
	
  	return nil
  	
end

return MatchUpdatedMessage

