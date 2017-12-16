
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local ChallengeType = {}
local ChallengeType_mt = {__index = ChallengeType}

function ChallengeType.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, ChallengeType_mt)
end

setmetatable(ChallengeType, {__index = GSData})

	
		
-- The shortCode for this challenge.
-- method type 5 - primitive return type
function ChallengeType:getChallengeShortCode()
	if self:getAttribute("challengeShortCode") ~= nil then
		return self:getAttribute("challengeShortCode")
  	end
	
  	return nil
  	
end
		
-- The description of this challenge.
-- method type 5 - primitive return type
function ChallengeType:getDescription()
	if self:getAttribute("description") ~= nil then
		return self:getAttribute("description")
  	end
	
  	return nil
  	
end
		
-- The name of the leaderboard for this challenge.
-- method type 5 - primitive return type
function ChallengeType:getGetleaderboardName()
	if self:getAttribute("getleaderboardName") ~= nil then
		return self:getAttribute("getleaderboardName")
  	end
	
  	return nil
  	
end
		
-- The name of this challenge.
-- method type 5 - primitive return type
function ChallengeType:getName()
	if self:getAttribute("name") ~= nil then
		return self:getAttribute("name")
  	end
	
  	return nil
  	
end
		
-- The tags for this challenge.
-- method type 5 - primitive return type
function ChallengeType:getTags()
	if self:getAttribute("tags") ~= nil then
		return self:getAttribute("tags")
  	end
	
  	return nil
  	
end

return ChallengeType

