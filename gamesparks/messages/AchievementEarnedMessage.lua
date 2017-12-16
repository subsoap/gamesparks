
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local AchievementEarnedMessage = {}
local AchievementEarnedMessage_mt = {__index = AchievementEarnedMessage}

function AchievementEarnedMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, AchievementEarnedMessage_mt)
end

setmetatable(AchievementEarnedMessage, {__index = GSResponse})

	
		
-- The name of achievement.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getAchievementName()
	if self:getAttribute("achievementName") ~= nil then
		return self:getAttribute("achievementName")
  	end
	
  	return nil
  	
end
		
-- The short code of the achievement.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getAchievementShortCode()
	if self:getAttribute("achievementShortCode") ~= nil then
		return self:getAttribute("achievementShortCode")
  	end
	
  	return nil
  	
end
		
-- The amount of type 1 currency earned.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getCurrency1Earned()
	if self:getAttribute("currency1Earned") ~= nil then
		return self:getAttribute("currency1Earned")
  	end
	
  	return nil
  	
end
		
-- The amount of type 2 currency earned.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getCurrency2Earned()
	if self:getAttribute("currency2Earned") ~= nil then
		return self:getAttribute("currency2Earned")
  	end
	
  	return nil
  	
end
		
-- The amount of type 3 currency earned.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getCurrency3Earned()
	if self:getAttribute("currency3Earned") ~= nil then
		return self:getAttribute("currency3Earned")
  	end
	
  	return nil
  	
end
		
-- The amount of type 4 currency earned.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getCurrency4Earned()
	if self:getAttribute("currency4Earned") ~= nil then
		return self:getAttribute("currency4Earned")
  	end
	
  	return nil
  	
end
		
-- The amount of type 5 currency earned.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getCurrency5Earned()
	if self:getAttribute("currency5Earned") ~= nil then
		return self:getAttribute("currency5Earned")
  	end
	
  	return nil
  	
end
		
-- The amount of type 6 currency earned.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getCurrency6Earned()
	if self:getAttribute("currency6Earned") ~= nil then
		return self:getAttribute("currency6Earned")
  	end
	
  	return nil
  	
end
		
-- An object containing the short codes and amounts of the currencies credited to the player
-- method type 5 - primitive return type
function AchievementEarnedMessage:getCurrencyAwards()
	if self:getAttribute("currencyAwards") ~= nil then
		return self:getAttribute("currencyAwards")
  	end
	
  	return nil
  	
end
		
-- A unique identifier for this message.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getMessageId()
	if self:getAttribute("messageId") ~= nil then
		return self:getAttribute("messageId")
  	end
	
  	return nil
  	
end
		
-- Flag indicating whether this message could be sent as a push notification or not.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getNotification()
	if self:getAttribute("notification") ~= nil then
		return self:getAttribute("notification")
  	end
	
  	return false
  	
end
		
-- ScriptData is arbitrary data that can be stored in a message by a Cloud Code script.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getSubTitle()
	if self:getAttribute("subTitle") ~= nil then
		return self:getAttribute("subTitle")
  	end
	
  	return nil
  	
end
		
-- A textual summary describing the message's purpose.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getSummary()
	if self:getAttribute("summary") ~= nil then
		return self:getAttribute("summary")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getTitle()
	if self:getAttribute("title") ~= nil then
		return self:getAttribute("title")
  	end
	
  	return nil
  	
end
		
-- The name of the virtual good that was earned.
-- method type 5 - primitive return type
function AchievementEarnedMessage:getVirtualGoodEarned()
	if self:getAttribute("virtualGoodEarned") ~= nil then
		return self:getAttribute("virtualGoodEarned")
  	end
	
  	return nil
  	
end

return AchievementEarnedMessage

