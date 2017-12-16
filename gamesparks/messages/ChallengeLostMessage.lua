
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local LeaderboardData = require("gamesparks.types.LeaderboardData")
local Challenge = require("gamesparks.types.Challenge")


local ChallengeLostMessage = {}
local ChallengeLostMessage_mt = {__index = ChallengeLostMessage}

function ChallengeLostMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ChallengeLostMessage_mt)
end

setmetatable(ChallengeLostMessage, {__index = GSResponse})

	
		
-- An object representing the challenge.
-- method type 2 - typed object return type
function ChallengeLostMessage:getChallenge()
	if self:getAttribute("challenge") ~= nil then
		return Challenge.new(self:getAttribute("challenge"))
	end
	  
	return nil
end		
				
		
-- The leaderboard data associated with this challenge.
-- method type 2 - typed object return type
function ChallengeLostMessage:getLeaderboardData()
	if self:getAttribute("leaderboardData") ~= nil then
		return LeaderboardData.new(self:getAttribute("leaderboardData"))
	end
	  
	return nil
end		
				
		
-- A unique identifier for this message.
-- method type 5 - primitive return type
function ChallengeLostMessage:getMessageId()
	if self:getAttribute("messageId") ~= nil then
		return self:getAttribute("messageId")
  	end
	
  	return nil
  	
end
		
-- Flag indicating whether this message could be sent as a push notification or not.
-- method type 5 - primitive return type
function ChallengeLostMessage:getNotification()
	if self:getAttribute("notification") ~= nil then
		return self:getAttribute("notification")
  	end
	
  	return false
  	
end
		
-- ScriptData is arbitrary data that can be stored in a message by a Cloud Code script.
-- method type 5 - primitive return type
function ChallengeLostMessage:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function ChallengeLostMessage:getSubTitle()
	if self:getAttribute("subTitle") ~= nil then
		return self:getAttribute("subTitle")
  	end
	
  	return nil
  	
end
		
-- A textual summary describing the message's purpose.
-- method type 5 - primitive return type
function ChallengeLostMessage:getSummary()
	if self:getAttribute("summary") ~= nil then
		return self:getAttribute("summary")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function ChallengeLostMessage:getTitle()
	if self:getAttribute("title") ~= nil then
		return self:getAttribute("title")
  	end
	
  	return nil
  	
end
		
-- The winning players name
-- method type 5 - primitive return type
function ChallengeLostMessage:getWinnerName()
	if self:getAttribute("winnerName") ~= nil then
		return self:getAttribute("winnerName")
  	end
	
  	return nil
  	
end

return ChallengeLostMessage

