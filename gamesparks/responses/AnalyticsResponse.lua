
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local AnalyticsResponse = {}
local AnalyticsResponse_mt = {__index = AnalyticsResponse}

function AnalyticsResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, AnalyticsResponse_mt)
end

setmetatable(AnalyticsResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function AnalyticsResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return AnalyticsResponse

