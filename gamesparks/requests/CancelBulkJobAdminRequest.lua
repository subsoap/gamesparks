local GSRequest = require("gamesparks.GSRequest")
local CancelBulkJobAdminResponse = require("gamesparks.responses.CancelBulkJobAdminResponse")

local CancelBulkJobAdminRequest = {}
local CancelBulkJobAdminRequest_mt = {__index = CancelBulkJobAdminRequest}

function CancelBulkJobAdminRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".CancelBulkJobAdminRequest"
  
  return setmetatable(instance, CancelBulkJobAdminRequest_mt)
end

setmetatable(CancelBulkJobAdminRequest, {__index = GSRequest})

function CancelBulkJobAdminRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function CancelBulkJobAdminRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(CancelBulkJobAdminResponse.new(message))
    end
  end)
end

	
function CancelBulkJobAdminRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function CancelBulkJobAdminRequest:setBulkJobIds(bulkJobIds)
	self:setAttribute("bulkJobIds", bulkJobIds)
end

return CancelBulkJobAdminRequest
