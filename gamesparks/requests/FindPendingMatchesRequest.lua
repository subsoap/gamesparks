local GSRequest = require("gamesparks.GSRequest")
local FindPendingMatchesResponse = require("gamesparks.responses.FindPendingMatchesResponse")

local FindPendingMatchesRequest = {}
local FindPendingMatchesRequest_mt = {__index = FindPendingMatchesRequest}

function FindPendingMatchesRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".FindPendingMatchesRequest"
  
  return setmetatable(instance, FindPendingMatchesRequest_mt)
end

setmetatable(FindPendingMatchesRequest, {__index = GSRequest})

function FindPendingMatchesRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function FindPendingMatchesRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(FindPendingMatchesResponse.new(message))
    end
  end)
end

	
function FindPendingMatchesRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function FindPendingMatchesRequest:setMatchGroup(matchGroup)
	self:setAttribute("matchGroup", matchGroup)
end
	
	
	
function FindPendingMatchesRequest:setMatchShortCode(matchShortCode)
	self:setAttribute("matchShortCode", matchShortCode)
end
	
	
	
function FindPendingMatchesRequest:setMaxMatchesToFind(maxMatchesToFind)
	self:setAttribute("maxMatchesToFind", maxMatchesToFind)
end

return FindPendingMatchesRequest
