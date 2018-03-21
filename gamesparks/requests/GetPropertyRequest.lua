local GSRequest = require("gamesparks.GSRequest")
local GetPropertyResponse = require("gamesparks.responses.GetPropertyResponse")

local GetPropertyRequest = {}
local GetPropertyRequest_mt = {__index = GetPropertyRequest}

function GetPropertyRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".GetPropertyRequest"
  
  return setmetatable(instance, GetPropertyRequest_mt)
end

setmetatable(GetPropertyRequest, {__index = GSRequest})

function GetPropertyRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function GetPropertyRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(GetPropertyResponse.new(message))
    end
  end)
end

	
function GetPropertyRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function GetPropertyRequest:setPropertyShortCode(propertyShortCode)
	self:setAttribute("propertyShortCode", propertyShortCode)
end

return GetPropertyRequest
