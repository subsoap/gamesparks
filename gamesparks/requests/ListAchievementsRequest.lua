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

function ListAchievementsRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
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
