local GSRequest = require("gamesparks.GSRequest")
local AnalyticsResponse = require("gamesparks.responses.AnalyticsResponse")

local AnalyticsRequest = {}
local AnalyticsRequest_mt = {__index = AnalyticsRequest}

function AnalyticsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".AnalyticsRequest"
  
  return setmetatable(instance, AnalyticsRequest_mt)
end

setmetatable(AnalyticsRequest, {__index = GSRequest})

function AnalyticsRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function AnalyticsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AnalyticsResponse.new(message))
    end
  end)
end

	
function AnalyticsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function AnalyticsRequest:setData(data)
	self:setAttribute("data", data)
end
	
	
	
function AnalyticsRequest:setEnd(_end)
	self:setAttribute("_end", _end)
end
	
	
	
function AnalyticsRequest:setKey(key)
	self:setAttribute("key", key)
end
	
	
	
function AnalyticsRequest:setStart(start)
	self:setAttribute("start", start)
end

return AnalyticsRequest
