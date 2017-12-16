
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local LeaderboardsEntriesResponse = {}
local LeaderboardsEntriesResponse_mt = {__index = LeaderboardsEntriesResponse}

function LeaderboardsEntriesResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, LeaderboardsEntriesResponse_mt)
end

setmetatable(LeaderboardsEntriesResponse, {__index = GSResponse})

	
		
-- The leaderboard entry data
-- method type 5 - primitive return type
function LeaderboardsEntriesResponse:getResults()
	if self:getAttribute("results") ~= nil then
		return self:getAttribute("results")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function LeaderboardsEntriesResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return LeaderboardsEntriesResponse

