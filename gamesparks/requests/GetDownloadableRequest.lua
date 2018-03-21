local GSRequest = require("gamesparks.GSRequest")
local GetDownloadableResponse = require("gamesparks.responses.GetDownloadableResponse")

local GetDownloadableRequest = {}
local GetDownloadableRequest_mt = {__index = GetDownloadableRequest}

function GetDownloadableRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".GetDownloadableRequest"
  
  return setmetatable(instance, GetDownloadableRequest_mt)
end

setmetatable(GetDownloadableRequest, {__index = GSRequest})

function GetDownloadableRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function GetDownloadableRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(GetDownloadableResponse.new(message))
    end
  end)
end

	
function GetDownloadableRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function GetDownloadableRequest:setShortCode(shortCode)
	self:setAttribute("shortCode", shortCode)
end

return GetDownloadableRequest
