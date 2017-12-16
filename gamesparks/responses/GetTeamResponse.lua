
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Player = require("gamesparks.types.Player")
local Team = require("gamesparks.types.Team")


local GetTeamResponse = {}
local GetTeamResponse_mt = {__index = GetTeamResponse}

function GetTeamResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, GetTeamResponse_mt)
end

setmetatable(GetTeamResponse, {__index = GSResponse})

	
		
-- The team members
-- method type 1 - typed object array return type
function GetTeamResponse:getMembers()
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
function GetTeamResponse:getOwner()
	if self:getAttribute("owner") ~= nil then
		return Player.new(self:getAttribute("owner"))
	end
	  
	return nil
end		
				
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function GetTeamResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- The Id of the team
-- method type 5 - primitive return type
function GetTeamResponse:getTeamId()
	if self:getAttribute("teamId") ~= nil then
		return self:getAttribute("teamId")
  	end
	
  	return nil
  	
end
		
-- The team name
-- method type 5 - primitive return type
function GetTeamResponse:getTeamName()
	if self:getAttribute("teamName") ~= nil then
		return self:getAttribute("teamName")
  	end
	
  	return nil
  	
end
		
-- The team type
-- method type 5 - primitive return type
function GetTeamResponse:getTeamType()
	if self:getAttribute("teamType") ~= nil then
		return self:getAttribute("teamType")
  	end
	
  	return nil
  	
end
		
-- A JSON array of teams.
-- method type 1 - typed object array return type
function GetTeamResponse:getTeams()
	local ret = {}
	local teams = self:getAttribute("teams")
	
	if teams ~= nil then
		for a = 1, #teams do
	    	ret[a] = Team.new(teams[a])
	    end
	end
	  
	return ret
end
			

return GetTeamResponse

