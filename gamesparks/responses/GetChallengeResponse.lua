
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Challenge = require("gamesparks.types.Challenge")


local GetChallengeResponse = {}
local GetChallengeResponse_mt = {__index = GetChallengeResponse}

function GetChallengeResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, GetChallengeResponse_mt)
end

setmetatable(GetChallengeResponse, {__index = GSResponse})

	
		
-- A JSON object representing the challenge.
-- method type 2 - typed object return type
function GetChallengeResponse:getChallenge()
	if self:getAttribute("challenge") ~= nil then
		return Challenge.new(self:getAttribute("challenge"))
	end
	  
	return nil
end		
				
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function GetChallengeResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return GetChallengeResponse

