local GSRequest = require("gamesparks.GSRequest")
local JoinTeamResponse = require("gamesparks.responses.JoinTeamResponse")

local JoinTeamRequest = {}
local JoinTeamRequest_mt = {__index = JoinTeamRequest}

function JoinTeamRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".JoinTeamRequest"
  
  return setmetatable(instance, JoinTeamRequest_mt)
end

setmetatable(JoinTeamRequest, {__index = GSRequest})

function JoinTeamRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function JoinTeamRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(JoinTeamResponse.new(message))
    end
  end)
end

	
function JoinTeamRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function JoinTeamRequest:setOwnerId(ownerId)
	self:setAttribute("ownerId", ownerId)
end
	
	
	
function JoinTeamRequest:setTeamId(teamId)
	self:setAttribute("teamId", teamId)
end
	
	
	
function JoinTeamRequest:setTeamType(teamType)
	self:setAttribute("teamType", teamType)
end

return JoinTeamRequest
