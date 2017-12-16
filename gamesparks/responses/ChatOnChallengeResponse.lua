
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local ChatOnChallengeResponse = {}
local ChatOnChallengeResponse_mt = {__index = ChatOnChallengeResponse}

function ChatOnChallengeResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ChatOnChallengeResponse_mt)
end

setmetatable(ChatOnChallengeResponse, {__index = GSResponse})

	
		
-- The challenge instance id
-- method type 5 - primitive return type
function ChatOnChallengeResponse:getChallengeInstanceId()
	if self:getAttribute("challengeInstanceId") ~= nil then
		return self:getAttribute("challengeInstanceId")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ChatOnChallengeResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return ChatOnChallengeResponse

