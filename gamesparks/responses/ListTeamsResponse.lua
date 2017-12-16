
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Team = require("gamesparks.types.Team")


local ListTeamsResponse = {}
local ListTeamsResponse_mt = {__index = ListTeamsResponse}

function ListTeamsResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ListTeamsResponse_mt)
end

setmetatable(ListTeamsResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ListTeamsResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A list of JSON objects containing team information
-- method type 1 - typed object array return type
function ListTeamsResponse:getTeams()
	local ret = {}
	local teams = self:getAttribute("teams")
	
	if teams ~= nil then
		for a = 1, #teams do
	    	ret[a] = Team.new(teams[a])
	    end
	end
	  
	return ret
end
			

return ListTeamsResponse

