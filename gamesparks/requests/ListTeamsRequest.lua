local GSRequest = require("gamesparks.GSRequest")
local ListTeamsResponse = require("gamesparks.responses.ListTeamsResponse")

local ListTeamsRequest = {}
local ListTeamsRequest_mt = {__index = ListTeamsRequest}

function ListTeamsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ListTeamsRequest"
  
  return setmetatable(instance, ListTeamsRequest_mt)
end

setmetatable(ListTeamsRequest, {__index = GSRequest})

function ListTeamsRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function ListTeamsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ListTeamsResponse.new(message))
    end
  end)
end

	
function ListTeamsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function ListTeamsRequest:setEntryCount(entryCount)
	self:setAttribute("entryCount", entryCount)
end
	
	
	
function ListTeamsRequest:setOffset(offset)
	self:setAttribute("offset", offset)
end
	
	
	
function ListTeamsRequest:setTeamNameFilter(teamNameFilter)
	self:setAttribute("teamNameFilter", teamNameFilter)
end
	
	
	
function ListTeamsRequest:setTeamTypeFilter(teamTypeFilter)
	self:setAttribute("teamTypeFilter", teamTypeFilter)
end

return ListTeamsRequest
