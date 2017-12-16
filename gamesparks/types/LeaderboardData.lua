
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local LeaderboardData = {}
local LeaderboardData_mt = {__index = LeaderboardData}

function LeaderboardData.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, LeaderboardData_mt)
end

setmetatable(LeaderboardData, {__index = GSData})

	
		
-- The city where the player was located when they logged this leaderboard entry.
-- method type 5 - primitive return type
function LeaderboardData:getCity()
	if self:getAttribute("city") ~= nil then
		return self:getAttribute("city")
  	end
	
  	return nil
  	
end
		
-- The country code where the player was located when they logged this leaderboard entry.
-- method type 5 - primitive return type
function LeaderboardData:getCountry()
	if self:getAttribute("country") ~= nil then
		return self:getAttribute("country")
  	end
	
  	return nil
  	
end
		
-- The players rank.
-- method type 5 - primitive return type
function LeaderboardData:getExternalIds()
	if self:getAttribute("externalIds") ~= nil then
		return self:getAttribute("externalIds")
  	end
	
  	return nil
  	
end
		
-- The players rank.
-- method type 5 - primitive return type
function LeaderboardData:getRank()
	if self:getAttribute("rank") ~= nil then
		return self:getAttribute("rank")
  	end
	
  	return math.nan
  	
end
		
-- The unique player id for this leaderboard entry.
-- method type 5 - primitive return type
function LeaderboardData:getUserId()
	if self:getAttribute("userId") ~= nil then
		return self:getAttribute("userId")
  	end
	
  	return nil
  	
end
		
-- The players display name.
-- method type 5 - primitive return type
function LeaderboardData:getUserName()
	if self:getAttribute("userName") ~= nil then
		return self:getAttribute("userName")
  	end
	
  	return nil
  	
end
		
-- The date when this leaderboard entry was created.
-- method type 5 - primitive return type
function LeaderboardData:getWhen()
	if self:getAttribute("when") ~= nil then
		return self:getAttribute("when")
  	end
	
  	return nil
  	
end

return LeaderboardData

