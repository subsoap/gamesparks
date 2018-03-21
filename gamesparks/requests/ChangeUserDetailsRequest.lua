local GSRequest = require("gamesparks.GSRequest")
local ChangeUserDetailsResponse = require("gamesparks.responses.ChangeUserDetailsResponse")

local ChangeUserDetailsRequest = {}
local ChangeUserDetailsRequest_mt = {__index = ChangeUserDetailsRequest}

function ChangeUserDetailsRequest.new(gs)
  local instance = GSRequest.new(gs)
 
  instance.data["@class"] = ".ChangeUserDetailsRequest"
  
  return setmetatable(instance, ChangeUserDetailsRequest_mt)
end

setmetatable(ChangeUserDetailsRequest, {__index = GSRequest})

function ChangeUserDetailsRequest:setTimeoutMilliSeconds(timeoutMilliSeconds)
  if timeoutMilliSeconds == nil or timeoutMilliSeconds <= 0 then
    timeoutMilliSeconds = self.gs.requestTimeout
  end
  
  self.timeoutMilliSeconds = timeoutMilliSeconds
end

function ChangeUserDetailsRequest:send(callback)
  GSRequest.send(self, function(message)
    if callback ~= nil then
      callback(ChangeUserDetailsResponse.new(message))
    end
  end)
end

	
function ChangeUserDetailsRequest:setScriptData(scriptData)
  self:setAttribute("scriptData", scriptData)
end
	
	
	
	
function ChangeUserDetailsRequest:setDisplayName(displayName)
	self:setAttribute("displayName", displayName)
end
	
	
	
function ChangeUserDetailsRequest:setLanguage(language)
	self:setAttribute("language", language)
end
	
	
	
function ChangeUserDetailsRequest:setNewPassword(newPassword)
	self:setAttribute("newPassword", newPassword)
end
	
	
	
function ChangeUserDetailsRequest:setOldPassword(oldPassword)
	self:setAttribute("oldPassword", oldPassword)
end
	
	
	
function ChangeUserDetailsRequest:setUserName(userName)
	self:setAttribute("userName", userName)
end

return ChangeUserDetailsRequest
