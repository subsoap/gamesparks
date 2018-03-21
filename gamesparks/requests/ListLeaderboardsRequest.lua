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

function ListLeaderboardsRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
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
