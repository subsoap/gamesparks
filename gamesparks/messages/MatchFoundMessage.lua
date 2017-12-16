
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Participant = require("gamesparks.types.Participant")


local MatchFoundMessage = {}
local MatchFoundMessage_mt = {__index = MatchFoundMessage}

function MatchFoundMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, MatchFoundMessage_mt)
end

setmetatable(MatchFoundMessage, {__index = GSResponse})

	
		
-- The accessToken used to authenticate this player for this match
-- method type 5 - primitive return type
function MatchFoundMessage:getAccessToken()
	if self:getAttribute("accessToken") ~= nil then
		return self:getAttribute("accessToken")
  	end
	
  	return nil
  	
end
		
-- The host to connect to for this match
-- method type 5 - primitive return type
function MatchFoundMessage:getHost()
	if self:getAttribute("host") ~= nil then
		return self:getAttribute("host")
  	end
	
  	return nil
  	
end
		
-- MatchData is arbitrary data that can be stored in a Match instance by a Cloud Code script.
-- method type 5 - primitive return type
function MatchFoundMessage:getMatchData()
	if self:getAttribute("matchData") ~= nil then
		return self:getAttribute("matchData")
  	end
	
  	return nil
  	
end
		
-- The group the player was assigned in the matchmaking request
-- method type 5 - primitive return type
function MatchFoundMessage:getMatchGroup()
	if self:getAttribute("matchGroup") ~= nil then
		return self:getAttribute("matchGroup")
  	end
	
  	return nil
  	
end
		
-- The id for this match instance
-- method type 5 - primitive return type
function MatchFoundMessage:getMatchId()
	if self:getAttribute("matchId") ~= nil then
		return self:getAttribute("matchId")
  	end
	
  	return nil
  	
end
		
-- The shortCode of the match type this message for
-- method type 5 - primitive return type
function MatchFoundMessage:getMatchShortCode()
	if self:getAttribute("matchShortCode") ~= nil then
		return self:getAttribute("matchShortCode")
  	end
	
  	return nil
  	
end
		
-- A unique identifier for this message.
-- method type 5 - primitive return type
function MatchFoundMessage:getMessageId()
	if self:getAttribute("messageId") ~= nil then
		return self:getAttribute("messageId")
  	end
	
  	return nil
  	
end
		
-- Flag indicating whether this message could be sent as a push notification or not.
-- method type 5 - primitive return type
function MatchFoundMessage:getNotification()
	if self:getAttribute("notification") ~= nil then
		return self:getAttribute("notification")
  	end
	
  	return false
  	
end
		
-- The participants in this match
-- method type 1 - typed object array return type
function MatchFoundMessage:getParticipants()
	local ret = {}
	local participants = self:getAttribute("participants")
	
	if participants ~= nil then
		for a = 1, #participants do
	    	ret[a] = Participant.new(participants[a])
	    end
	end
	  
	return ret
end
			
		
-- The port to connect to for this match
-- method type 5 - primitive return type
function MatchFoundMessage:getPort()
	if self:getAttribute("port") ~= nil then
		return self:getAttribute("port")
  	end
	
  	return math.nan
  	
end
		
-- ScriptData is arbitrary data that can be stored in a message by a Cloud Code script.
-- method type 5 - primitive return type
function MatchFoundMessage:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function MatchFoundMessage:getSubTitle()
	if self:getAttribute("subTitle") ~= nil then
		return self:getAttribute("subTitle")
  	end
	
  	return nil
  	
end
		
-- A textual summary describing the message's purpose.
-- method type 5 - primitive return type
function MatchFoundMessage:getSummary()
	if self:getAttribute("summary") ~= nil then
		return self:getAttribute("summary")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function MatchFoundMessage:getTitle()
	if self:getAttribute("title") ~= nil then
		return self:getAttribute("title")
  	end
	
  	return nil
  	
end

return MatchFoundMessage

