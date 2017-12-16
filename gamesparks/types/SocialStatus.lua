
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local SocialStatus = {}
local SocialStatus_mt = {__index = SocialStatus}

function SocialStatus.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, SocialStatus_mt)
end

setmetatable(SocialStatus, {__index = GSData})

	
		
-- When the token is still active.
-- method type 5 - primitive return type
function SocialStatus:getActive()
	if self:getAttribute("active") ~= nil then
		return self:getAttribute("active")
  	end
	
  	return false
  	
end
		
-- When the token expires (if available).
-- method type 5 - primitive return type
function SocialStatus:getExpires()
	if self:getAttribute("expires") ~= nil then
		return rfc3339toDate(self:getAttribute("expires"));
  	end
	
  	return nil
  	
end
		
-- The identifier of the external platform.
-- method type 5 - primitive return type
function SocialStatus:getSystemId()
	if self:getAttribute("systemId") ~= nil then
		return self:getAttribute("systemId")
  	end
	
  	return nil
  	
end

return SocialStatus

