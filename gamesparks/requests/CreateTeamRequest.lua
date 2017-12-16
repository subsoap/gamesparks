local GSRequest = require("gamesparks.GSRequest")
local CreateTeamResponse = require("gamesparks.responses.CreateTeamResponse")

local CreateTeamRequest = {}
local CreateTeamRequest_mt = {__index = CreateTeamRequest}

function CreateTeamRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".CreateTeamRequest"
  
  return setmetatable(instance, CreateTeamRequest_mt)
end

setmetatable(CreateTeamRequest, {__index = GSRequest})

function CreateTeamRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function CreateTeamRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(CreateTeamResponse.new(message))
    end
  end)
end

	
function CreateTeamRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function CreateTeamRequest:setTeamId(teamId)
	self:setAttribute("teamId", teamId)
end
	
	
	
function CreateTeamRequest:setTeamName(teamName)
	self:setAttribute("teamName", teamName)
end
	
	
	
function CreateTeamRequest:setTeamType(teamType)
	self:setAttribute("teamType", teamType)
end

return CreateTeamRequest
