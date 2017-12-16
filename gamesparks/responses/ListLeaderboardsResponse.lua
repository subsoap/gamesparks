
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Leaderboard = require("gamesparks.types.Leaderboard")


local ListLeaderboardsResponse = {}
local ListLeaderboardsResponse_mt = {__index = ListLeaderboardsResponse}

function ListLeaderboardsResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ListLeaderboardsResponse_mt)
end

setmetatable(ListLeaderboardsResponse, {__index = GSResponse})

	
		
-- A list of JSON object containing leaderboard meta data
-- method type 1 - typed object array return type
function ListLeaderboardsResponse:getLeaderboards()
	local ret = {}
	local leaderboards = self:getAttribute("leaderboards")
	
	if leaderboards ~= nil then
		for a = 1, #leaderboards do
	    	ret[a] = Leaderboard.new(leaderboards[a])
	    end
	end
	  
	return ret
end
			
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ListLeaderboardsResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return ListLeaderboardsResponse

