
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local LeaderboardData = require("gamesparks.types.LeaderboardData")


local SocialRankChangedMessage = {}
local SocialRankChangedMessage_mt = {__index = SocialRankChangedMessage}

function SocialRankChangedMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, SocialRankChangedMessage_mt)
end

setmetatable(SocialRankChangedMessage, {__index = GSResponse})

	
		
-- The game id that this message relates to.
-- method type 5 - primitive return type
function SocialRankChangedMessage:getGameId()
	if self:getAttribute("gameId") ~= nil then
		return self:getAttribute("gameId")
  	end
	
  	return math.nan
  	
end
		
-- The leaderboard's name.
-- method type 5 - primitive return type
function SocialRankChangedMessage:getLeaderboardName()
	if self:getAttribute("leaderboardName") ~= nil then
		return self:getAttribute("leaderboardName")
  	end
	
  	return nil
  	
end
		
-- The leaderboard shortcode.
-- method type 5 - primitive return type
function SocialRankChangedMessage:getLeaderboardShortCode()
	if self:getAttribute("leaderboardShortCode") ~= nil then
		return self:getAttribute("leaderboardShortCode")
  	end
	
  	return nil
  	
end
		
-- A unique identifier for this message.
-- method type 5 - primitive return type
function SocialRankChangedMessage:getMessageId()
	if self:getAttribute("messageId") ~= nil then
		return self:getAttribute("messageId")
  	end
	
  	return nil
  	
end
		
-- Flag indicating whether this message could be sent as a push notification or not.
-- method type 5 - primitive return type
function SocialRankChangedMessage:getNotification()
	if self:getAttribute("notification") ~= nil then
		return self:getAttribute("notification")
  	end
	
  	return false
  	
end
		
-- ScriptData is arbitrary data that can be stored in a message by a Cloud Code script.
-- method type 5 - primitive return type
function SocialRankChangedMessage:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function SocialRankChangedMessage:getSubTitle()
	if self:getAttribute("subTitle") ~= nil then
		return self:getAttribute("subTitle")
  	end
	
  	return nil
  	
end
		
-- A textual summary describing the message's purpose.
-- method type 5 - primitive return type
function SocialRankChangedMessage:getSummary()
	if self:getAttribute("summary") ~= nil then
		return self:getAttribute("summary")
  	end
	
  	return nil
  	
end
		
-- The score details of the player whose score the receiving player has passed.
-- method type 2 - typed object return type
function SocialRankChangedMessage:getThem()
	if self:getAttribute("them") ~= nil then
		return LeaderboardData.new(self:getAttribute("them"))
	end
	  
	return nil
end		
				
		
-- A textual title for the message.
-- method type 5 - primitive return type
function SocialRankChangedMessage:getTitle()
	if self:getAttribute("title") ~= nil then
		return self:getAttribute("title")
  	end
	
  	return nil
  	
end
		
-- The score details of the receiving player.
-- method type 2 - typed object return type
function SocialRankChangedMessage:getYou()
	if self:getAttribute("you") ~= nil then
		return LeaderboardData.new(self:getAttribute("you"))
	end
	  
	return nil
end		
				

return SocialRankChangedMessage

