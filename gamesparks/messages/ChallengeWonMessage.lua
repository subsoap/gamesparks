
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local LeaderboardData = require("gamesparks.types.LeaderboardData")
local Challenge = require("gamesparks.types.Challenge")


local ChallengeWonMessage = {}
local ChallengeWonMessage_mt = {__index = ChallengeWonMessage}

function ChallengeWonMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ChallengeWonMessage_mt)
end

setmetatable(ChallengeWonMessage, {__index = GSResponse})

	
		
-- An object representing the challenge.
-- method type 2 - typed object return type
function ChallengeWonMessage:getChallenge()
	if self:getAttribute("challenge") ~= nil then
		return Challenge.new(self:getAttribute("challenge"))
	end
	  
	return nil
end		
				
		
-- The amount of type 1 currency the player has won.
-- method type 5 - primitive return type
function ChallengeWonMessage:getCurrency1Won()
	if self:getAttribute("currency1Won") ~= nil then
		return self:getAttribute("currency1Won")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 2 currency the player has won.
-- method type 5 - primitive return type
function ChallengeWonMessage:getCurrency2Won()
	if self:getAttribute("currency2Won") ~= nil then
		return self:getAttribute("currency2Won")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 3 currency the player has won.
-- method type 5 - primitive return type
function ChallengeWonMessage:getCurrency3Won()
	if self:getAttribute("currency3Won") ~= nil then
		return self:getAttribute("currency3Won")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 4 currency the player has won.
-- method type 5 - primitive return type
function ChallengeWonMessage:getCurrency4Won()
	if self:getAttribute("currency4Won") ~= nil then
		return self:getAttribute("currency4Won")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 5 currency the player has won.
-- method type 5 - primitive return type
function ChallengeWonMessage:getCurrency5Won()
	if self:getAttribute("currency5Won") ~= nil then
		return self:getAttribute("currency5Won")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 6 currency the player has won.
-- method type 5 - primitive return type
function ChallengeWonMessage:getCurrency6Won()
	if self:getAttribute("currency6Won") ~= nil then
		return self:getAttribute("currency6Won")
  	end
	
  	return math.nan
  	
end
		
-- An object containing the short codes and amounts of the currencies the player has won
-- method type 5 - primitive return type
function ChallengeWonMessage:getCurrencyWinnings()
	if self:getAttribute("currencyWinnings") ~= nil then
		return self:getAttribute("currencyWinnings")
  	end
	
  	return nil
  	
end
		
-- The leaderboard data associated with this challenge.
-- method type 2 - typed object return type
function ChallengeWonMessage:getLeaderboardData()
	if self:getAttribute("leaderboardData") ~= nil then
		return LeaderboardData.new(self:getAttribute("leaderboardData"))
	end
	  
	return nil
end		
				
		
-- A unique identifier for this message.
-- method type 5 - primitive return type
function ChallengeWonMessage:getMessageId()
	if self:getAttribute("messageId") ~= nil then
		return self:getAttribute("messageId")
  	end
	
  	return nil
  	
end
		
-- Flag indicating whether this message could be sent as a push notification or not.
-- method type 5 - primitive return type
function ChallengeWonMessage:getNotification()
	if self:getAttribute("notification") ~= nil then
		return self:getAttribute("notification")
  	end
	
  	return false
  	
end
		
-- ScriptData is arbitrary data that can be stored in a message by a Cloud Code script.
-- method type 5 - primitive return type
function ChallengeWonMessage:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function ChallengeWonMessage:getSubTitle()
	if self:getAttribute("subTitle") ~= nil then
		return self:getAttribute("subTitle")
  	end
	
  	return nil
  	
end
		
-- A textual summary describing the message's purpose.
-- method type 5 - primitive return type
function ChallengeWonMessage:getSummary()
	if self:getAttribute("summary") ~= nil then
		return self:getAttribute("summary")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function ChallengeWonMessage:getTitle()
	if self:getAttribute("title") ~= nil then
		return self:getAttribute("title")
  	end
	
  	return nil
  	
end
		
-- The winning player's name.
-- method type 5 - primitive return type
function ChallengeWonMessage:getWinnerName()
	if self:getAttribute("winnerName") ~= nil then
		return self:getAttribute("winnerName")
  	end
	
  	return nil
  	
end

return ChallengeWonMessage

