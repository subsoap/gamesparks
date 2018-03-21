local GSRequest = require("gamesparks.GSRequest")
local GetTeamResponse = require("gamesparks.responses.GetTeamResponse")

local GetTeamRequest = {}
local GetTeamRequest_mt = {__index = GetTeamRequest}

function GetTeamRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".GetTeamRequest"
  
  return setmetatable(instance, GetTeamRequest_mt)
end

setmetatable(GetTeamRequest, {__index = GSRequest})

function GetTeamRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function GetTeamRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(GetTeamResponse.new(message))
    end
  end)
end

	
function GetTeamRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function GetTeamRequest:setOwnerId(ownerId)
	self:setAttribute("ownerId", ownerId)
end
	
	
	
function GetTeamRequest:setTeamId(teamId)
	self:setAttribute("teamId", teamId)
end
	
	
	
function GetTeamRequest:setTeamType(teamType)
	self:setAttribute("teamType", teamType)
end

return GetTeamRequest
