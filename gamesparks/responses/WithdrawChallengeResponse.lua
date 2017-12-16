
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local WithdrawChallengeResponse = {}
local WithdrawChallengeResponse_mt = {__index = WithdrawChallengeResponse}

function WithdrawChallengeResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, WithdrawChallengeResponse_mt)
end

setmetatable(WithdrawChallengeResponse, {__index = GSResponse})

	
		
-- A challenge instance id
-- method type 5 - primitive return type
function WithdrawChallengeResponse:getChallengeInstanceId()
	if self:getAttribute("challengeInstanceId") ~= nil then
		return self:getAttribute("challengeInstanceId")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function WithdrawChallengeResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return WithdrawChallengeResponse

