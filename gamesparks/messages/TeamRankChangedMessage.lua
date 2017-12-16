
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local LeaderboardData = require("gamesparks.types.LeaderboardData")


local TeamRankChangedMessage = {}
local TeamRankChangedMessage_mt = {__index = TeamRankChangedMessage}

function TeamRankChangedMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, TeamRankChangedMessage_mt)
end

setmetatable(TeamRankChangedMessage, {__index = GSResponse})

	
		
-- The game id that this message relates to.
-- method type 5 - primitive return type
function TeamRankChangedMessage:getGameId()
	if self:getAttribute("gameId") ~= nil then
		return self:getAttribute("gameId")
  	end
	
  	return math.nan
  	
end
		
-- The leaderboard's name.
-- method type 5 - primitive return type
function TeamRankChangedMessage:getLeaderboardName()
	if self:getAttribute("leaderboardName") ~= nil then
		return self:getAttribute("leaderboardName")
  	end
	
  	return nil
  	
end
		
-- The leaderboard shortcode.
-- method type 5 - primitive return type
function TeamRankChangedMessage:getLeaderboardShortCode()
	if self:getAttribute("leaderboardShortCode") ~= nil then
		return self:getAttribute("leaderboardShortCode")
  	end
	
  	return nil
  	
end
		
-- A unique identifier for this message.
-- method type 5 - primitive return type
function TeamRankChangedMessage:getMessageId()
	if self:getAttribute("messageId") ~= nil then
		return self:getAttribute("messageId")
  	end
	
  	return nil
  	
end
		
-- Flag indicating whether this message could be sent as a push notification or not.
-- method type 5 - primitive return type
function TeamRankChangedMessage:getNotification()
	if self:getAttribute("notification") ~= nil then
		return self:getAttribute("notification")
  	end
	
  	return false
  	
end
		
-- ScriptData is arbitrary data that can be stored in a message by a Cloud Code script.
-- method type 5 - primitive return type
function TeamRankChangedMessage:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function TeamRankChangedMessage:getSubTitle()
	if self:getAttribute("subTitle") ~= nil then
		return self:getAttribute("subTitle")
  	end
	
  	return nil
  	
end
		
-- A textual summary describing the message's purpose.
-- method type 5 - primitive return type
function TeamRankChangedMessage:getSummary()
	if self:getAttribute("summary") ~= nil then
		return self:getAttribute("summary")
  	end
	
  	return nil
  	
end
		
-- The score details of the team whose score the receiving team's players have passed.
-- method type 2 - typed object return type
function TeamRankChangedMessage:getThem()
	if self:getAttribute("them") ~= nil then
		return LeaderboardData.new(self:getAttribute("them"))
	end
	  
	return nil
end		
				
		
-- A textual title for the message.
-- method type 5 - primitive return type
function TeamRankChangedMessage:getTitle()
	if self:getAttribute("title") ~= nil then
		return self:getAttribute("title")
  	end
	
  	return nil
  	
end
		
-- The score details of the receiving team.
-- method type 2 - typed object return type
function TeamRankChangedMessage:getYou()
	if self:getAttribute("you") ~= nil then
		return LeaderboardData.new(self:getAttribute("you"))
	end
	  
	return nil
end		
				

return TeamRankChangedMessage

