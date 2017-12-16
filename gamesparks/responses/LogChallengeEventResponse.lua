
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local LogChallengeEventResponse = {}
local LogChallengeEventResponse_mt = {__index = LogChallengeEventResponse}

function LogChallengeEventResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, LogChallengeEventResponse_mt)
end

setmetatable(LogChallengeEventResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function LogChallengeEventResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return LogChallengeEventResponse

