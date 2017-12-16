
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local LeaderboardData = require("gamesparks.types.LeaderboardData")


local LeaderboardDataResponse = {}
local LeaderboardDataResponse_mt = {__index = LeaderboardDataResponse}

function LeaderboardDataResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, LeaderboardDataResponse_mt)
end

setmetatable(LeaderboardDataResponse, {__index = GSResponse})

	
		
-- The leaderboard's challenge id
-- method type 5 - primitive return type
function LeaderboardDataResponse:getChallengeInstanceId()
	if self:getAttribute("challengeInstanceId") ~= nil then
		return self:getAttribute("challengeInstanceId")
  	end
	
  	return nil
  	
end
		
-- The leaderboard data
-- method type 1 - typed object array return type
function LeaderboardDataResponse:getData()
	local ret = {}
	local data = self:getAttribute("data")
	
	if data ~= nil then
		for a = 1, #data do
	    	ret[a] = LeaderboardData.new(data[a])
	    end
	end
	  
	return ret
end
			
		
-- The first item in the leaderboard data
-- method type 1 - typed object array return type
function LeaderboardDataResponse:getFirst()
	local ret = {}
	local first = self:getAttribute("first")
	
	if first ~= nil then
		for a = 1, #first do
	    	ret[a] = LeaderboardData.new(first[a])
	    end
	end
	  
	return ret
end
			
		
-- The last item in the leaderboard data
-- method type 1 - typed object array return type
function LeaderboardDataResponse:getLast()
	local ret = {}
	local last = self:getAttribute("last")
	
	if last ~= nil then
		for a = 1, #last do
	    	ret[a] = LeaderboardData.new(last[a])
	    end
	end
	  
	return ret
end
			
		
-- The leaderboard short code
-- method type 5 - primitive return type
function LeaderboardDataResponse:getLeaderboardShortCode()
	if self:getAttribute("leaderboardShortCode") ~= nil then
		return self:getAttribute("leaderboardShortCode")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function LeaderboardDataResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return LeaderboardDataResponse

