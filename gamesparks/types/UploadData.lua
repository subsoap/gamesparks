
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local UploadData = {}
local UploadData_mt = {__index = UploadData}

function UploadData.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, UploadData_mt)
end

setmetatable(UploadData, {__index = GSData})

	
		
-- The filename of the file that was uploaded.
-- method type 5 - primitive return type
function UploadData:getFileName()
	if self:getAttribute("fileName") ~= nil then
		return self:getAttribute("fileName")
  	end
	
  	return nil
  	
end
		
-- The unique player id of the player that uploaded the file.
-- method type 5 - primitive return type
function UploadData:getPlayerId()
	if self:getAttribute("playerId") ~= nil then
		return self:getAttribute("playerId")
  	end
	
  	return nil
  	
end

return UploadData

