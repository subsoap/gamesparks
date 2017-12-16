
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local DeclineChallengeResponse = {}
local DeclineChallengeResponse_mt = {__index = DeclineChallengeResponse}

function DeclineChallengeResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, DeclineChallengeResponse_mt)
end

setmetatable(DeclineChallengeResponse, {__index = GSResponse})

	
		
-- The challenge instance id
-- method type 5 - primitive return type
function DeclineChallengeResponse:getChallengeInstanceId()
	if self:getAttribute("challengeInstanceId") ~= nil then
		return self:getAttribute("challengeInstanceId")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function DeclineChallengeResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return DeclineChallengeResponse

