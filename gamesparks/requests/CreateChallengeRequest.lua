local GSRequest = require("gamesparks.GSRequest")
local CreateChallengeResponse = require("gamesparks.responses.CreateChallengeResponse")

local CreateChallengeRequest = {}
local CreateChallengeRequest_mt = {__index = CreateChallengeRequest}

function CreateChallengeRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".CreateChallengeRequest"
  
  return setmetatable(instance, CreateChallengeRequest_mt)
end

setmetatable(CreateChallengeRequest, {__index = GSRequest})

function CreateChallengeRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function CreateChallengeRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(CreateChallengeResponse.new(message))
    end
  end)
end

	
function CreateChallengeRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function CreateChallengeRequest:setAccessType(accessType)
	self:setAttribute("accessType", accessType)
end
	
	
	
function CreateChallengeRequest:setAutoStartJoinedChallengeOnMaxPlayers(autoStartJoinedChallengeOnMaxPlayers)
	self:setAttribute("autoStartJoinedChallengeOnMaxPlayers", autoStartJoinedChallengeOnMaxPlayers)
end
	
	
	
function CreateChallengeRequest:setChallengeMessage(challengeMessage)
	self:setAttribute("challengeMessage", challengeMessage)
end
	
	
	
function CreateChallengeRequest:setChallengeShortCode(challengeShortCode)
	self:setAttribute("challengeShortCode", challengeShortCode)
end
	
	
	
function CreateChallengeRequest:setCurrency1Wager(currency1Wager)
	self:setAttribute("currency1Wager", currency1Wager)
end
	
	
	
function CreateChallengeRequest:setCurrency2Wager(currency2Wager)
	self:setAttribute("currency2Wager", currency2Wager)
end
	
	
	
function CreateChallengeRequest:setCurrency3Wager(currency3Wager)
	self:setAttribute("currency3Wager", currency3Wager)
end
	
	
	
function CreateChallengeRequest:setCurrency4Wager(currency4Wager)
	self:setAttribute("currency4Wager", currency4Wager)
end
	
	
	
function CreateChallengeRequest:setCurrency5Wager(currency5Wager)
	self:setAttribute("currency5Wager", currency5Wager)
end
	
	
	
function CreateChallengeRequest:setCurrency6Wager(currency6Wager)
	self:setAttribute("currency6Wager", currency6Wager)
end
	
	
	
function CreateChallengeRequest:setCurrencyWagers(currencyWagers)
	self:setAttribute("currencyWagers", currencyWagers)
end
	
	
	
function CreateChallengeRequest:setEligibilityCriteria(eligibilityCriteria)
	self:setAttribute("eligibilityCriteria", eligibilityCriteria)
end
	
	
	
function CreateChallengeRequest:setEndTime(endTime)
	self:setAttribute("endTime", endTime)
end
	
	
	
function CreateChallengeRequest:setExpiryTime(expiryTime)
	self:setAttribute("expiryTime", expiryTime)
end
	
	
	
function CreateChallengeRequest:setMaxAttempts(maxAttempts)
	self:setAttribute("maxAttempts", maxAttempts)
end
	
	
	
function CreateChallengeRequest:setMaxPlayers(maxPlayers)
	self:setAttribute("maxPlayers", maxPlayers)
end
	
	
	
function CreateChallengeRequest:setMinPlayers(minPlayers)
	self:setAttribute("minPlayers", minPlayers)
end
	
	
	
function CreateChallengeRequest:setSilent(silent)
	self:setAttribute("silent", silent)
end
	
	
	
function CreateChallengeRequest:setStartTime(startTime)
	self:setAttribute("startTime", startTime)
end
	
	
	
function CreateChallengeRequest:setUsersToChallenge(usersToChallenge)
	self:setAttribute("usersToChallenge", usersToChallenge)
end

return CreateChallengeRequest
