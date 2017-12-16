local GSRequest = require("gamesparks.GSRequest")
local ListBulkJobsAdminResponse = require("gamesparks.responses.ListBulkJobsAdminResponse")

local ListBulkJobsAdminRequest = {}
local ListBulkJobsAdminRequest_mt = {__index = ListBulkJobsAdminRequest}

function ListBulkJobsAdminRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ListBulkJobsAdminRequest"
  
  return setmetatable(instance, ListBulkJobsAdminRequest_mt)
end

setmetatable(ListBulkJobsAdminRequest, {__index = GSRequest})

function ListBulkJobsAdminRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function ListBulkJobsAdminRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ListBulkJobsAdminResponse.new(message))
    end
  end)
end

	
function ListBulkJobsAdminRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function ListBulkJobsAdminRequest:setBulkJobIds(bulkJobIds)
	self:setAttribute("bulkJobIds", bulkJobIds)
end

return ListBulkJobsAdminRequest
