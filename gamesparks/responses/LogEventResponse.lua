
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local LogEventResponse = {}
local LogEventResponse_mt = {__index = LogEventResponse}

function LogEventResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, LogEventResponse_mt)
end

setmetatable(LogEventResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function LogEventResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return LogEventResponse

