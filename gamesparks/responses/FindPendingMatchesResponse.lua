
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local PendingMatch = require("gamesparks.types.PendingMatch")


local FindPendingMatchesResponse = {}
local FindPendingMatchesResponse_mt = {__index = FindPendingMatchesResponse}

function FindPendingMatchesResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, FindPendingMatchesResponse_mt)
end

setmetatable(FindPendingMatchesResponse, {__index = GSResponse})

	
		
-- A list of JSON objects containing pending matches
-- method type 1 - typed object array return type
function FindPendingMatchesResponse:getPendingMatches()
	local ret = {}
	local pendingMatches = self:getAttribute("pendingMatches")
	
	if pendingMatches ~= nil then
		for a = 1, #pendingMatches do
	    	ret[a] = PendingMatch.new(pendingMatches[a])
	    end
	end
	  
	return ret
end
			
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function FindPendingMatchesResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return FindPendingMatchesResponse

