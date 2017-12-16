
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local BatchAdminResponse = {}
local BatchAdminResponse_mt = {__index = BatchAdminResponse}

function BatchAdminResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, BatchAdminResponse_mt)
end

setmetatable(BatchAdminResponse, {__index = GSResponse})

	
		
-- A map of responses by player ID
-- method type 5 - primitive return type
function BatchAdminResponse:getResponses()
	if self:getAttribute("responses") ~= nil then
		return self:getAttribute("responses")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function BatchAdminResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return BatchAdminResponse

