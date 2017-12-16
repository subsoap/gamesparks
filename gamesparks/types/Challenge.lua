
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")

local PlayerTurnCount = require("gamesparks.types.PlayerTurnCount")
local PlayerDetail = require("gamesparks.types.PlayerDetail")


local Challenge = {}
local Challenge_mt = {__index = Challenge}

function Challenge.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, Challenge_mt)
end

setmetatable(Challenge, {__index = GSData})

	
		
-- A list of PlayerDetail objects that represents the players that have accepted this challenge.
-- method type 1 - typed object array return type
function Challenge:getAccepted()
	local ret = {}
	local accepted = self:getAttribute("accepted")
	
	if accepted ~= nil then
		for a = 1, #accepted do
	    	ret[a] = PlayerDetail.new(accepted[a])
	    end
	end
	  
	return ret
end
			
		
-- A unique identifier for this challenge.
-- method type 5 - primitive return type
function Challenge:getChallengeId()
	if self:getAttribute("challengeId") ~= nil then
		return self:getAttribute("challengeId")
  	end
	
  	return nil
  	
end
		
-- The message included in the challenge by the challenging player who created the challenge.
-- method type 5 - primitive return type
function Challenge:getChallengeMessage()
	if self:getAttribute("challengeMessage") ~= nil then
		return self:getAttribute("challengeMessage")
  	end
	
  	return nil
  	
end
		
-- The name of the challenge that this message relates to.
-- method type 5 - primitive return type
function Challenge:getChallengeName()
	if self:getAttribute("challengeName") ~= nil then
		return self:getAttribute("challengeName")
  	end
	
  	return nil
  	
end
		
-- A list of PlayerDetail objects that represents the players that were challenged in this challenge.
-- method type 1 - typed object array return type
function Challenge:getChallenged()
	local ret = {}
	local challenged = self:getAttribute("challenged")
	
	if challenged ~= nil then
		for a = 1, #challenged do
	    	ret[a] = PlayerDetail.new(challenged[a])
	    end
	end
	  
	return ret
end
			
		
-- Details of the player who issued this challenge.
-- method type 2 - typed object return type
function Challenge:getChallenger()
	if self:getAttribute("challenger") ~= nil then
		return PlayerDetail.new(self:getAttribute("challenger"))
	end
	  
	return nil
end		
				
		
-- The amount of type 1 currency that has been wagered on this challenge.
-- method type 5 - primitive return type
function Challenge:getCurrency1Wager()
	if self:getAttribute("currency1Wager") ~= nil then
		return self:getAttribute("currency1Wager")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 2 currency that has been wagered on this challenge.
-- method type 5 - primitive return type
function Challenge:getCurrency2Wager()
	if self:getAttribute("currency2Wager") ~= nil then
		return self:getAttribute("currency2Wager")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 3 currency that has been wagered on this challenge.
-- method type 5 - primitive return type
function Challenge:getCurrency3Wager()
	if self:getAttribute("currency3Wager") ~= nil then
		return self:getAttribute("currency3Wager")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 4 currency that has been wagered on this challenge.
-- method type 5 - primitive return type
function Challenge:getCurrency4Wager()
	if self:getAttribute("currency4Wager") ~= nil then
		return self:getAttribute("currency4Wager")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 5 currency that has been wagered on this challenge.
-- method type 5 - primitive return type
function Challenge:getCurrency5Wager()
	if self:getAttribute("currency5Wager") ~= nil then
		return self:getAttribute("currency5Wager")
  	end
	
  	return math.nan
  	
end
		
-- The amount of type 6 currency that has been wagered on this challenge.
-- method type 5 - primitive return type
function Challenge:getCurrency6Wager()
	if self:getAttribute("currency6Wager") ~= nil then
		return self:getAttribute("currency6Wager")
  	end
	
  	return math.nan
  	
end
		
-- An object representing the currencies that have been wagered on this challenge.
-- method type 5 - primitive return type
function Challenge:getCurrencyWagers()
	if self:getAttribute("currencyWagers") ~= nil then
		return self:getAttribute("currencyWagers")
  	end
	
  	return nil
  	
end
		
-- A list of PlayerDetail objects that represents the players that have declined this challenge.
-- method type 1 - typed object array return type
function Challenge:getDeclined()
	local ret = {}
	local declined = self:getAttribute("declined")
	
	if declined ~= nil then
		for a = 1, #declined do
	    	ret[a] = PlayerDetail.new(declined[a])
	    end
	end
	  
	return ret
end
			
		
-- The date when the challenge ends.
-- method type 5 - primitive return type
function Challenge:getEndDate()
	if self:getAttribute("endDate") ~= nil then
		return rfc3339toDate(self:getAttribute("endDate"));
  	end
	
  	return nil
  	
end
		
-- The latest date that a player can accept the challenge.
-- method type 5 - primitive return type
function Challenge:getExpiryDate()
	if self:getAttribute("expiryDate") ~= nil then
		return rfc3339toDate(self:getAttribute("expiryDate"));
  	end
	
  	return nil
  	
end
		
-- The maximum number of turns that this challenge is configured for.
-- method type 5 - primitive return type
function Challenge:getMaxTurns()
	if self:getAttribute("maxTurns") ~= nil then
		return self:getAttribute("maxTurns")
  	end
	
  	return math.nan
  	
end
		
-- In a turn based challenge this fields contains the player's id whose turn it is next.
-- method type 5 - primitive return type
function Challenge:getNextPlayer()
	if self:getAttribute("nextPlayer") ~= nil then
		return self:getAttribute("nextPlayer")
  	end
	
  	return nil
  	
end
		
-- ScriptData is arbitrary data that can be stored in a challenge instance by a Cloud Code script.
-- method type 5 - primitive return type
function Challenge:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- The challenge's short code.
-- method type 5 - primitive return type
function Challenge:getShortCode()
	if self:getAttribute("shortCode") ~= nil then
		return self:getAttribute("shortCode")
  	end
	
  	return nil
  	
end
		
-- The date when the challenge starts.
-- method type 5 - primitive return type
function Challenge:getStartDate()
	if self:getAttribute("startDate") ~= nil then
		return rfc3339toDate(self:getAttribute("startDate"));
  	end
	
  	return nil
  	
end
		
-- One of these possible state values: ISSUED, EXPIRED, ACCEPTED, DECLINED, COMPLETE, WITHDRAWN, RUNNING, WAITING, RECEIVED
-- method type 5 - primitive return type
function Challenge:getState()
	if self:getAttribute("state") ~= nil then
		return self:getAttribute("state")
  	end
	
  	return nil
  	
end
		
-- A collection containing the number of turns taken by each player that has accepted the challenge.
-- Each turn count is a Long keyed on a String that represents the player's id
-- method type 1 - typed object array return type
function Challenge:getTurnCount()
	local ret = {}
	local turnCount = self:getAttribute("turnCount")
	
	if turnCount ~= nil then
		for a = 1, #turnCount do
	    	ret[a] = PlayerTurnCount.new(turnCount[a])
	    end
	end
	  
	return ret
end
			

return Challenge

