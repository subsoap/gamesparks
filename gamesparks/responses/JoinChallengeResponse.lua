
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local JoinChallengeResponse = {}
local JoinChallengeResponse_mt = {__index = JoinChallengeResponse}

function JoinChallengeResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, JoinChallengeResponse_mt)
end

setmetatable(JoinChallengeResponse, {__index = GSResponse})

	
		
-- Whether the player successfully joined the challenge
-- method type 5 - primitive return type
function JoinChallengeResponse:getJoined()
	if self:getAttribute("joined") ~= nil then
		return self:getAttribute("joined")
  	end
	
  	return false
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function JoinChallengeResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return JoinChallengeResponse

