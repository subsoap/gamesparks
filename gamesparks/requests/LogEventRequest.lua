local GSRequest = require("gamesparks.GSRequest")
local LogEventResponse = require("gamesparks.responses.LogEventResponse")

local LogEventRequest = {}
local LogEventRequest_mt = {__index = LogEventRequest}

function LogEventRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".LogEventRequest"
  
  return setmetatable(instance, LogEventRequest_mt)
end

setmetatable(LogEventRequest, {__index = GSRequest})

function LogEventRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function LogEventRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(LogEventResponse.new(message))
    end
  end)
end

		
function LogEventRequest:setEventAttribute(key, value)
	self:setAttribute(key, value)
end
		
	
	
	
function LogEventRequest:setEventKey(eventKey)
	self:setAttribute("eventKey", eventKey)
end

return LogEventRequest
