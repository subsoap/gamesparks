local GSRequest = require("gamesparks.GSRequest")
local BatchAdminResponse = require("gamesparks.responses.BatchAdminResponse")

local BatchAdminRequest = {}
local BatchAdminRequest_mt = {__index = BatchAdminRequest}

function BatchAdminRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".BatchAdminRequest"
  
  return setmetatable(instance, BatchAdminRequest_mt)
end

setmetatable(BatchAdminRequest, {__index = GSRequest})

function BatchAdminRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function BatchAdminRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(BatchAdminResponse.new(message))
    end
  end)
end

	
function BatchAdminRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function BatchAdminRequest:setPlayerIds(playerIds)
	self:setAttribute("playerIds", playerIds)
end
	
	
	
function BatchAdminRequest:setRequest(request)
	self:setAttribute("request", request)
end

return BatchAdminRequest
