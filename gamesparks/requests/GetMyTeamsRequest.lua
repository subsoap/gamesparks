local GSRequest = require("gamesparks.GSRequest")
local GetMyTeamsResponse = require("gamesparks.responses.GetMyTeamsResponse")

local GetMyTeamsRequest = {}
local GetMyTeamsRequest_mt = {__index = GetMyTeamsRequest}

function GetMyTeamsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".GetMyTeamsRequest"
  
  return setmetatable(instance, GetMyTeamsRequest_mt)
end

setmetatable(GetMyTeamsRequest, {__index = GSRequest})

function GetMyTeamsRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function GetMyTeamsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(GetMyTeamsResponse.new(message))
    end
  end)
end

	
function GetMyTeamsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function GetMyTeamsRequest:setOwnedOnly(ownedOnly)
	self:setAttribute("ownedOnly", ownedOnly)
end
	
	
	
function GetMyTeamsRequest:setTeamTypes(teamTypes)
	self:setAttribute("teamTypes", teamTypes)
end

return GetMyTeamsRequest
