local GSRequest = require("gamesparks.GSRequest")
local LeaveTeamResponse = require("gamesparks.responses.LeaveTeamResponse")

local LeaveTeamRequest = {}
local LeaveTeamRequest_mt = {__index = LeaveTeamRequest}

function LeaveTeamRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".LeaveTeamRequest"
  
  return setmetatable(instance, LeaveTeamRequest_mt)
end

setmetatable(LeaveTeamRequest, {__index = GSRequest})

function LeaveTeamRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function LeaveTeamRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(LeaveTeamResponse.new(message))
    end
  end)
end

	
function LeaveTeamRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function LeaveTeamRequest:setOwnerId(ownerId)
	self:setAttribute("ownerId", ownerId)
end
	
	
	
function LeaveTeamRequest:setTeamId(teamId)
	self:setAttribute("teamId", teamId)
end
	
	
	
function LeaveTeamRequest:setTeamType(teamType)
	self:setAttribute("teamType", teamType)
end

return LeaveTeamRequest
