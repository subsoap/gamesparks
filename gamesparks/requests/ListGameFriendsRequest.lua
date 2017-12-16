local GSRequest = require("gamesparks.GSRequest")
local ListGameFriendsResponse = require("gamesparks.responses.ListGameFriendsResponse")

local ListGameFriendsRequest = {}
local ListGameFriendsRequest_mt = {__index = ListGameFriendsRequest}

function ListGameFriendsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ListGameFriendsRequest"
  
  return setmetatable(instance, ListGameFriendsRequest_mt)
end

setmetatable(ListGameFriendsRequest, {__index = GSRequest})

function ListGameFriendsRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function ListGameFriendsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ListGameFriendsResponse.new(message))
    end
  end)
end

	
function ListGameFriendsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	

return ListGameFriendsRequest
