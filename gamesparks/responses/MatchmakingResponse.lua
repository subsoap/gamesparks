
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local MatchmakingResponse = {}
local MatchmakingResponse_mt = {__index = MatchmakingResponse}

function MatchmakingResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, MatchmakingResponse_mt)
end

setmetatable(MatchmakingResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function MatchmakingResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return MatchmakingResponse

