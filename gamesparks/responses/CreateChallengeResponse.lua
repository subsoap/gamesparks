
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local CreateChallengeResponse = {}
local CreateChallengeResponse_mt = {__index = CreateChallengeResponse}

function CreateChallengeResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, CreateChallengeResponse_mt)
end

setmetatable(CreateChallengeResponse, {__index = GSResponse})

	
		
-- The challenge instance id
-- method type 5 - primitive return type
function CreateChallengeResponse:getChallengeInstanceId()
	if self:getAttribute("challengeInstanceId") ~= nil then
		return self:getAttribute("challengeInstanceId")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function CreateChallengeResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return CreateChallengeResponse

