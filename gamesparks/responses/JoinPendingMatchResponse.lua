
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local PendingMatch = require("gamesparks.types.PendingMatch")


local JoinPendingMatchResponse = {}
local JoinPendingMatchResponse_mt = {__index = JoinPendingMatchResponse}

function JoinPendingMatchResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, JoinPendingMatchResponse_mt)
end

setmetatable(JoinPendingMatchResponse, {__index = GSResponse})

	
		
-- A JSON object containing the new pending match
-- method type 2 - typed object return type
function JoinPendingMatchResponse:getPendingMatch()
	if self:getAttribute("pendingMatch") ~= nil then
		return PendingMatch.new(self:getAttribute("pendingMatch"))
	end
	  
	return nil
end		
				
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function JoinPendingMatchResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return JoinPendingMatchResponse

