
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local ChallengeType = require("gamesparks.types.ChallengeType")


local ListChallengeTypeResponse = {}
local ListChallengeTypeResponse_mt = {__index = ListChallengeTypeResponse}

function ListChallengeTypeResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ListChallengeTypeResponse_mt)
end

setmetatable(ListChallengeTypeResponse, {__index = GSResponse})

	
		
-- A list of JSON objects containing the challenge templates for the game
-- method type 1 - typed object array return type
function ListChallengeTypeResponse:getChallengeTemplates()
	local ret = {}
	local challengeTemplates = self:getAttribute("challengeTemplates")
	
	if challengeTemplates ~= nil then
		for a = 1, #challengeTemplates do
	    	ret[a] = ChallengeType.new(challengeTemplates[a])
	    end
	end
	  
	return ret
end
			
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ListChallengeTypeResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return ListChallengeTypeResponse

