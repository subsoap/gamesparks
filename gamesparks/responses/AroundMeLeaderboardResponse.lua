
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local LeaderboardData = require("gamesparks.types.LeaderboardData")


local AroundMeLeaderboardResponse = {}
local AroundMeLeaderboardResponse_mt = {__index = AroundMeLeaderboardResponse}

function AroundMeLeaderboardResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, AroundMeLeaderboardResponse_mt)
end

setmetatable(AroundMeLeaderboardResponse, {__index = GSResponse})

	
		
-- The leaderboard's challenge id
-- method type 5 - primitive return type
function AroundMeLeaderboardResponse:getChallengeInstanceId()
	if self:getAttribute("challengeInstanceId") ~= nil then
		return self:getAttribute("challengeInstanceId")
  	end
	
  	return nil
  	
end
		
-- The leaderboard data
-- method type 1 - typed object array return type
function AroundMeLeaderboardResponse:getData()
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
function AroundMeLeaderboardResponse:getFirst()
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
function AroundMeLeaderboardResponse:getLast()
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
function AroundMeLeaderboardResponse:getLeaderboardShortCode()
	if self:getAttribute("leaderboardShortCode") ~= nil then
		return self:getAttribute("leaderboardShortCode")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function AroundMeLeaderboardResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- True if the response contains a social leaderboard's data
-- method type 5 - primitive return type
function AroundMeLeaderboardResponse:getSocial()
	if self:getAttribute("social") ~= nil then
		return self:getAttribute("social")
  	end
	
  	return false
  	
end

return AroundMeLeaderboardResponse

