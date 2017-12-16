
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local SocialStatus = require("gamesparks.types.SocialStatus")


local SocialStatusResponse = {}
local SocialStatusResponse_mt = {__index = SocialStatusResponse}

function SocialStatusResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, SocialStatusResponse_mt)
end

setmetatable(SocialStatusResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function SocialStatusResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A list of social statuses.
-- method type 1 - typed object array return type
function SocialStatusResponse:getStatuses()
	local ret = {}
	local statuses = self:getAttribute("statuses")
	
	if statuses ~= nil then
		for a = 1, #statuses do
	    	ret[a] = SocialStatus.new(statuses[a])
	    end
	end
	  
	return ret
end
			

return SocialStatusResponse

