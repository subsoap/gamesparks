
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")

local Player = require("gamesparks.types.Player")


local Team = {}
local Team_mt = {__index = Team}

function Team.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, Team_mt)
end

setmetatable(Team, {__index = GSData})

	
		
-- The team members
-- method type 1 - typed object array return type
function Team:getMembers()
	local ret = {}
	local members = self:getAttribute("members")
	
	if members ~= nil then
		for a = 1, #members do
	    	ret[a] = Player.new(members[a])
	    end
	end
	  
	return ret
end
			
		
-- A summary of the owner
-- method type 2 - typed object return type
function Team:getOwner()
	if self:getAttribute("owner") ~= nil then
		return Player.new(self:getAttribute("owner"))
	end
	  
	return nil
end		
				
		
-- The Id of the team
-- method type 5 - primitive return type
function Team:getTeamId()
	if self:getAttribute("teamId") ~= nil then
		return self:getAttribute("teamId")
  	end
	
  	return nil
  	
end
		
-- The team name
-- method type 5 - primitive return type
function Team:getTeamName()
	if self:getAttribute("teamName") ~= nil then
		return self:getAttribute("teamName")
  	end
	
  	return nil
  	
end
		
-- The team type
-- method type 5 - primitive return type
function Team:getTeamType()
	if self:getAttribute("teamType") ~= nil then
		return self:getAttribute("teamType")
  	end
	
  	return nil
  	
end

return Team

