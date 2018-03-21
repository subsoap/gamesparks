local GSRequest = require("gamesparks.GSRequest")
local ListChallengeResponse = require("gamesparks.responses.ListChallengeResponse")

local ListChallengeRequest = {}
local ListChallengeRequest_mt = {__index = ListChallengeRequest}

function ListChallengeRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ListChallengeRequest"
  
  return setmetatable(instance, ListChallengeRequest_mt)
end

setmetatable(ListChallengeRequest, {__index = GSRequest})

function ListChallengeRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function ListChallengeRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ListChallengeResponse.new(message))
    end
  end)
end

	
function ListChallengeRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function ListChallengeRequest:setEntryCount(entryCount)
	self:setAttribute("entryCount", entryCount)
end
	
	
	
function ListChallengeRequest:setOffset(offset)
	self:setAttribute("offset", offset)
end
	
	
	
function ListChallengeRequest:setShortCode(shortCode)
	self:setAttribute("shortCode", shortCode)
end
	
	
	
function ListChallengeRequest:setState(state)
	self:setAttribute("state", state)
end
	
	
	
function ListChallengeRequest:setStates(states)
	self:setAttribute("states", states)
end

return ListChallengeRequest
