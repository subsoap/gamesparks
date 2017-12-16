local GSRequest = require("gamesparks.GSRequest")
local ListLeaderboardsResponse = require("gamesparks.responses.ListLeaderboardsResponse")

local ListLeaderboardsRequest = {}
local ListLeaderboardsRequest_mt = {__index = ListLeaderboardsRequest}

function ListLeaderboardsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ListLeaderboardsRequest"
  
  return setmetatable(instance, ListLeaderboardsRequest_mt)
end

setmetatable(ListLeaderboardsRequest, {__index = GSRequest})

function ListLeaderboardsRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function ListLeaderboardsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ListLeaderboardsResponse.new(message))
    end
  end)
end

	
function ListLeaderboardsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	

return ListLeaderboardsRequest
