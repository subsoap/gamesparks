
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local GameSparksErrorResponse = {}
local GameSparksErrorResponse_mt = {__index = GameSparksErrorResponse}

function GameSparksErrorResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, GameSparksErrorResponse_mt)
end

setmetatable(GameSparksErrorResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function GameSparksErrorResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return GameSparksErrorResponse

