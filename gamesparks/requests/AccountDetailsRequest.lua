local GSRequest = require("gamesparks.GSRequest")
local AccountDetailsResponse = require("gamesparks.responses.AccountDetailsResponse")

local AccountDetailsRequest = {}
local AccountDetailsRequest_mt = {__index = AccountDetailsRequest}

function AccountDetailsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".AccountDetailsRequest"
  
  return setmetatable(instance, AccountDetailsRequest_mt)
end

setmetatable(AccountDetailsRequest, {__index = GSRequest})

function AccountDetailsRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function AccountDetailsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(AccountDetailsResponse.new(message))
    end
  end)
end

	
function AccountDetailsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	

return AccountDetailsRequest
