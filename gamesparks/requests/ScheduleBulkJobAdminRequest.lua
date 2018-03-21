local GSRequest = require("gamesparks.GSRequest")
local ScheduleBulkJobAdminResponse = require("gamesparks.responses.ScheduleBulkJobAdminResponse")

local ScheduleBulkJobAdminRequest = {}
local ScheduleBulkJobAdminRequest_mt = {__index = ScheduleBulkJobAdminRequest}

function ScheduleBulkJobAdminRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ScheduleBulkJobAdminRequest"
  
  return setmetatable(instance, ScheduleBulkJobAdminRequest_mt)
end

setmetatable(ScheduleBulkJobAdminRequest, {__index = GSRequest})

function ScheduleBulkJobAdminRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function ScheduleBulkJobAdminRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ScheduleBulkJobAdminResponse.new(message))
    end
  end)
end

	
function ScheduleBulkJobAdminRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function ScheduleBulkJobAdminRequest:setData(data)
	self:setAttribute("data", data)
end
	
	
	
function ScheduleBulkJobAdminRequest:setModuleShortCode(moduleShortCode)
	self:setAttribute("moduleShortCode", moduleShortCode)
end
	
	
	
function ScheduleBulkJobAdminRequest:setPlayerQuery(playerQuery)
	self:setAttribute("playerQuery", playerQuery)
end
	
	
	
function ScheduleBulkJobAdminRequest:setScheduledTime(scheduledTime)
	self:setAttribute("scheduledTime", scheduledTime)
end
	
	
	
function ScheduleBulkJobAdminRequest:setScript(script)
	self:setAttribute("script", script)
end

return ScheduleBulkJobAdminRequest
