
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Achievement = require("gamesparks.types.Achievement")


local ListAchievementsResponse = {}
local ListAchievementsResponse_mt = {__index = ListAchievementsResponse}

function ListAchievementsResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ListAchievementsResponse_mt)
end

setmetatable(ListAchievementsResponse, {__index = GSResponse})

	
		
-- A list of JSON achievment objects
-- method type 1 - typed object array return type
function ListAchievementsResponse:getAchievements()
	local ret = {}
	local achievements = self:getAttribute("achievements")
	
	if achievements ~= nil then
		for a = 1, #achievements do
	    	ret[a] = Achievement.new(achievements[a])
	    end
	end
	  
	return ret
end
			
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ListAchievementsResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return ListAchievementsResponse

