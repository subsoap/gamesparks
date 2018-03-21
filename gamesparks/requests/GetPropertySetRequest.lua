local GSRequest = require("gamesparks.GSRequest")
local GetPropertySetResponse = require("gamesparks.responses.GetPropertySetResponse")

local GetPropertySetRequest = {}
local GetPropertySetRequest_mt = {__index = GetPropertySetRequest}

function GetPropertySetRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".GetPropertySetRequest"
  
  return setmetatable(instance, GetPropertySetRequest_mt)
end

setmetatable(GetPropertySetRequest, {__index = GSRequest})

function GetPropertySetRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function GetPropertySetRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(GetPropertySetResponse.new(message))
    end
  end)
end

	
function GetPropertySetRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function GetPropertySetRequest:setPropertySetShortCode(propertySetShortCode)
	self:setAttribute("propertySetShortCode", propertySetShortCode)
end

return GetPropertySetRequest
