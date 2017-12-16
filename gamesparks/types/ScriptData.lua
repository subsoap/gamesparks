
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local ScriptData = {}
local ScriptData_mt = {__index = ScriptData}

function ScriptData.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, ScriptData_mt)
end

setmetatable(ScriptData, {__index = GSData})

	
		
-- An arbitrary data key
-- method type 5 - primitive return type
function ScriptData:getMyKey()
	if self:getAttribute("myKey") ~= nil then
		return self:getAttribute("myKey")
  	end
	
  	return nil
  	
end
		
-- An arbitrary data value.
-- method type 5 - primitive return type
function ScriptData:getMyValue()
	if self:getAttribute("myValue") ~= nil then
		return self:getAttribute("myValue")
  	end
	
  	return nil
  	
end

return ScriptData

