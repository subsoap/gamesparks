local GSRequest = require("gamesparks.GSRequest")
local ListAchievementsResponse = require("gamesparks.responses.ListAchievementsResponse")

local ListAchievementsRequest = {}
local ListAchievementsRequest_mt = {__index = ListAchievementsRequest}

function ListAchievementsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ListAchievementsRequest"
  
  return setmetatable(instance, ListAchievementsRequest_mt)
end

setmetatable(ListAchievementsRequest, {__index = GSRequest})

function ListAchievementsRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function ListAchievementsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ListAchievementsResponse.new(message))
    end
  end)
end

	
function ListAchievementsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	

return ListAchievementsRequest
