local GSRequest = require("gamesparks.GSRequest")
local GetUploadUrlResponse = require("gamesparks.responses.GetUploadUrlResponse")

local GetUploadUrlRequest = {}
local GetUploadUrlRequest_mt = {__index = GetUploadUrlRequest}

function GetUploadUrlRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".GetUploadUrlRequest"
  
  return setmetatable(instance, GetUploadUrlRequest_mt)
end

setmetatable(GetUploadUrlRequest, {__index = GSRequest})

function GetUploadUrlRequest:setTimeoutSeconds(timeoutSeconds)
  if timeoutSeconds == nil then
    timeoutSeconds = 10
  end
  
  self.timeoutSeconds = timeoutSeconds
end

function GetUploadUrlRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(GetUploadUrlResponse.new(message))
    end
  end)
end

	
function GetUploadUrlRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function GetUploadUrlRequest:setUploadData(uploadData)
	self:setAttribute("uploadData", uploadData)
end

return GetUploadUrlRequest
