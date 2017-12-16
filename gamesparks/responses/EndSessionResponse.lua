
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local EndSessionResponse = {}
local EndSessionResponse_mt = {__index = EndSessionResponse}

function EndSessionResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, EndSessionResponse_mt)
end

setmetatable(EndSessionResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function EndSessionResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- The length of this session
-- method type 5 - primitive return type
function EndSessionResponse:getSessionDuration()
	if self:getAttribute("sessionDuration") ~= nil then
		return self:getAttribute("sessionDuration")
  	end
	
  	return math.nan
  	
end

return EndSessionResponse

