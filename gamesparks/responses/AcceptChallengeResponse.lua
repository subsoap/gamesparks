
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local AcceptChallengeResponse = {}
local AcceptChallengeResponse_mt = {__index = AcceptChallengeResponse}

function AcceptChallengeResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, AcceptChallengeResponse_mt)
end

setmetatable(AcceptChallengeResponse, {__index = GSResponse})

	
		
-- The ID of the challenge
-- method type 5 - primitive return type
function AcceptChallengeResponse:getChallengeInstanceId()
	if self:getAttribute("challengeInstanceId") ~= nil then
		return self:getAttribute("challengeInstanceId")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function AcceptChallengeResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return AcceptChallengeResponse

