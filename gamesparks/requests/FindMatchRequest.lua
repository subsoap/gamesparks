local GSRequest = require("gamesparks.GSRequest")
local FindMatchResponse = require("gamesparks.responses.FindMatchResponse")

local FindMatchRequest = {}
local FindMatchRequest_mt = {__index = FindMatchRequest}

function FindMatchRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".FindMatchRequest"
  
  return setmetatable(instance, FindMatchRequest_mt)
end

setmetatable(FindMatchRequest, {__index = GSRequest})

function FindMatchRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function FindMatchRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(FindMatchResponse.new(message))
    end
  end)
end

	
function FindMatchRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function FindMatchRequest:setAction(action)
	self:setAttribute("action", action)
end
	
	
	
function FindMatchRequest:setMatchGroup(matchGroup)
	self:setAttribute("matchGroup", matchGroup)
end
	
	
	
function FindMatchRequest:setMatchShortCode(matchShortCode)
	self:setAttribute("matchShortCode", matchShortCode)
end
	
	
	
function FindMatchRequest:setSkill(skill)
	self:setAttribute("skill", skill)
end

return FindMatchRequest
