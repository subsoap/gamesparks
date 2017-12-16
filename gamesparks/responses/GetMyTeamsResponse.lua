
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Team = require("gamesparks.types.Team")


local GetMyTeamsResponse = {}
local GetMyTeamsResponse_mt = {__index = GetMyTeamsResponse}

function GetMyTeamsResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, GetMyTeamsResponse_mt)
end

setmetatable(GetMyTeamsResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function GetMyTeamsResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- The team data
-- method type 1 - typed object array return type
function GetMyTeamsResponse:getTeams()
	local ret = {}
	local teams = self:getAttribute("teams")
	
	if teams ~= nil then
		for a = 1, #teams do
	    	ret[a] = Team.new(teams[a])
	    end
	end
	  
	return ret
end
			

return GetMyTeamsResponse

