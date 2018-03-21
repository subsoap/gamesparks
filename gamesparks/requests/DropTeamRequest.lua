local GSRequest = require("gamesparks.GSRequest")
local DropTeamResponse = require("gamesparks.responses.DropTeamResponse")

local DropTeamRequest = {}
local DropTeamRequest_mt = {__index = DropTeamRequest}

function DropTeamRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".DropTeamRequest"
  
  return setmetatable(instance, DropTeamRequest_mt)
end

setmetatable(DropTeamRequest, {__index = GSRequest})

function DropTeamRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function DropTeamRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(DropTeamResponse.new(message))
    end
  end)
end

	
function DropTeamRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function DropTeamRequest:setOwnerId(ownerId)
	self:setAttribute("ownerId", ownerId)
end
	
	
	
function DropTeamRequest:setTeamId(teamId)
	self:setAttribute("teamId", teamId)
end
	
	
	
function DropTeamRequest:setTeamType(teamType)
	self:setAttribute("teamType", teamType)
end

return DropTeamRequest
