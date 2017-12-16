
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local GetLeaderboardEntriesResponse = {}
local GetLeaderboardEntriesResponse_mt = {__index = GetLeaderboardEntriesResponse}

function GetLeaderboardEntriesResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, GetLeaderboardEntriesResponse_mt)
end

setmetatable(GetLeaderboardEntriesResponse, {__index = GSResponse})

	
		
-- The leaderboard entry data
-- method type 5 - primitive return type
function GetLeaderboardEntriesResponse:getResults()
	if self:getAttribute("results") ~= nil then
		return self:getAttribute("results")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function GetLeaderboardEntriesResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return GetLeaderboardEntriesResponse

