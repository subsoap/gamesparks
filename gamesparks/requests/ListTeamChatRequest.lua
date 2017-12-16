local GSRequest = require("gamesparks.GSRequest")
local ListTeamChatResponse = require("gamesparks.responses.ListTeamChatResponse")

local ListTeamChatRequest = {}
local ListTeamChatRequest_mt = {__index = ListTeamChatRequest}

function ListTeamChatRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ListTeamChatRequest"
  
  return setmetatable(instance, ListTeamChatRequest_mt)
end

setmetatable(ListTeamChatRequest, {__index = GSRequest})

function ListTeamChatRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function ListTeamChatRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ListTeamChatResponse.new(message))
    end
  end)
end

	
function ListTeamChatRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function ListTeamChatRequest:setEntryCount(entryCount)
	self:setAttribute("entryCount", entryCount)
end
	
	
	
function ListTeamChatRequest:setOffset(offset)
	self:setAttribute("offset", offset)
end
	
	
	
function ListTeamChatRequest:setOwnerId(ownerId)
	self:setAttribute("ownerId", ownerId)
end
	
	
	
function ListTeamChatRequest:setTeamId(teamId)
	self:setAttribute("teamId", teamId)
end
	
	
	
function ListTeamChatRequest:setTeamType(teamType)
	self:setAttribute("teamType", teamType)
end

return ListTeamChatRequest
