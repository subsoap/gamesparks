
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")

local LeaderboardData = require("gamesparks.types.LeaderboardData")


local LeaderboardRankDetails = {}
local LeaderboardRankDetails_mt = {__index = LeaderboardRankDetails}

function LeaderboardRankDetails.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, LeaderboardRankDetails_mt)
end

setmetatable(LeaderboardRankDetails, {__index = GSData})

	
		
-- The leaderboard entries of the players friends that were beaten as part of this score submission.
-- method type 1 - typed object array return type
function LeaderboardRankDetails:getFriendsPassed()
	local ret = {}
	local friendsPassed = self:getAttribute("friendsPassed")
	
	if friendsPassed ~= nil then
		for a = 1, #friendsPassed do
	    	ret[a] = LeaderboardData.new(friendsPassed[a])
	    end
	end
	  
	return ret
end
			
		
-- The number of entries in this leaderboard.
-- method type 5 - primitive return type
function LeaderboardRankDetails:getGlobalCount()
	if self:getAttribute("globalCount") ~= nil then
		return self:getAttribute("globalCount")
  	end
	
  	return math.nan
  	
end
		
-- The Global Rank of the player in this leaderboard before the score was submitted.
-- method type 5 - primitive return type
function LeaderboardRankDetails:getGlobalFrom()
	if self:getAttribute("globalFrom") ~= nil then
		return self:getAttribute("globalFrom")
  	end
	
  	return math.nan
  	
end
		
-- The old global rank of the player as a percentage of the total number of scores in this leaderboard .
-- method type 5 - primitive return type
function LeaderboardRankDetails:getGlobalFromPercent()
	if self:getAttribute("globalFromPercent") ~= nil then
		return self:getAttribute("globalFromPercent")
  	end
	
  	return math.nan
  	
end
		
-- The Global Rank of the player in this leaderboard after the score was submitted.
-- method type 5 - primitive return type
function LeaderboardRankDetails:getGlobalTo()
	if self:getAttribute("globalTo") ~= nil then
		return self:getAttribute("globalTo")
  	end
	
  	return math.nan
  	
end
		
-- The new global rank of the player as a percentage of the total number of scores in this leaderboard .
-- method type 5 - primitive return type
function LeaderboardRankDetails:getGlobalToPercent()
	if self:getAttribute("globalToPercent") ~= nil then
		return self:getAttribute("globalToPercent")
  	end
	
  	return math.nan
  	
end
		
-- The number of friend entries the player has in this leaderboard.
-- method type 5 - primitive return type
function LeaderboardRankDetails:getSocialCount()
	if self:getAttribute("socialCount") ~= nil then
		return self:getAttribute("socialCount")
  	end
	
  	return math.nan
  	
end
		
-- The Social Rank of the player in this leaderboard before the score was submitted.
-- method type 5 - primitive return type
function LeaderboardRankDetails:getSocialFrom()
	if self:getAttribute("socialFrom") ~= nil then
		return self:getAttribute("socialFrom")
  	end
	
  	return math.nan
  	
end
		
-- The old social rank of the player as a percentage of the total number of friend scores in this leaderboard.
-- method type 5 - primitive return type
function LeaderboardRankDetails:getSocialFromPercent()
	if self:getAttribute("socialFromPercent") ~= nil then
		return self:getAttribute("socialFromPercent")
  	end
	
  	return math.nan
  	
end
		
-- The Social Rank of the player in this leaderboard after the score was submitted.
-- method type 5 - primitive return type
function LeaderboardRankDetails:getSocialTo()
	if self:getAttribute("socialTo") ~= nil then
		return self:getAttribute("socialTo")
  	end
	
  	return math.nan
  	
end
		
-- The old global rank of the player as a percentage of the total number of friend scores in this leaderboard.
-- method type 5 - primitive return type
function LeaderboardRankDetails:getSocialToPercent()
	if self:getAttribute("socialToPercent") ~= nil then
		return self:getAttribute("socialToPercent")
  	end
	
  	return math.nan
  	
end
		
-- The leaderboard entries of the global players that were beaten as part of this score submission. Requires Top N to be configured on the leaderboard
-- method type 1 - typed object array return type
function LeaderboardRankDetails:getTopNPassed()
	local ret = {}
	local topNPassed = self:getAttribute("topNPassed")
	
	if topNPassed ~= nil then
		for a = 1, #topNPassed do
	    	ret[a] = LeaderboardData.new(topNPassed[a])
	    end
	end
	  
	return ret
end
			

return LeaderboardRankDetails

