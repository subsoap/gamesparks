
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local Participant = {}
local Participant_mt = {__index = Participant}

function Participant.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, Participant_mt)
end

setmetatable(Participant, {__index = GSData})

	
		
-- The achievements of the Player
-- method type 4 - primitive array return type
function Participant:getAchievements()
	local ret = {}
	local achievements = self:getAttribute("achievements")
	
	if achievements ~= nil then
		for a = 1, #achievements do
	    	ret[a] = achievements[a]
	    end
	end
	  
	return ret
end
		
-- The display name of the Player
-- method type 5 - primitive return type
function Participant:getDisplayName()
	if self:getAttribute("displayName") ~= nil then
		return self:getAttribute("displayName")
  	end
	
  	return nil
  	
end
		
-- The external Id's of the Player
-- method type 5 - primitive return type
function Participant:getExternalIds()
	if self:getAttribute("externalIds") ~= nil then
		return self:getAttribute("externalIds")
  	end
	
  	return nil
  	
end
		
-- The Id of the Player
-- method type 5 - primitive return type
function Participant:getId()
	if self:getAttribute("id") ~= nil then
		return self:getAttribute("id")
  	end
	
  	return nil
  	
end
		
-- The online status of the Player
-- method type 5 - primitive return type
function Participant:getOnline()
	if self:getAttribute("online") ~= nil then
		return self:getAttribute("online")
  	end
	
  	return false
  	
end
		
-- A JSON Map of any data that was associated to this user
-- method type 5 - primitive return type
function Participant:getParticipantData()
	if self:getAttribute("participantData") ~= nil then
		return self:getAttribute("participantData")
  	end
	
  	return nil
  	
end
		
-- The peerId of this participant within the match
-- method type 5 - primitive return type
function Participant:getPeerId()
	if self:getAttribute("peerId") ~= nil then
		return self:getAttribute("peerId")
  	end
	
  	return math.nan
  	
end
		
-- The script data of the Player
-- method type 5 - primitive return type
function Participant:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- The virtual goods of the Player
-- method type 4 - primitive array return type
function Participant:getVirtualGoods()
	local ret = {}
	local virtualGoods = self:getAttribute("virtualGoods")
	
	if virtualGoods ~= nil then
		for a = 1, #virtualGoods do
	    	ret[a] = virtualGoods[a]
	    end
	end
	  
	return ret
end

return Participant

