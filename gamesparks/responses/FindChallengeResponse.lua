
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Challenge = require("gamesparks.types.Challenge")


local FindChallengeResponse = {}
local FindChallengeResponse_mt = {__index = FindChallengeResponse}

function FindChallengeResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, FindChallengeResponse_mt)
end

setmetatable(FindChallengeResponse, {__index = GSResponse})

	
		
-- A list of JSON objects representing the challenges.
-- method type 1 - typed object array return type
function FindChallengeResponse:getChallengeInstances()
	local ret = {}
	local challengeInstances = self:getAttribute("challengeInstances")
	
	if challengeInstances ~= nil then
		for a = 1, #challengeInstances do
	    	ret[a] = Challenge.new(challengeInstances[a])
	    end
	end
	  
	return ret
end
			
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function FindChallengeResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return FindChallengeResponse

