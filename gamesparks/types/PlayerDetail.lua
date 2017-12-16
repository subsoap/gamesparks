
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local PlayerDetail = {}
local PlayerDetail_mt = {__index = PlayerDetail}

function PlayerDetail.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, PlayerDetail_mt)
end

setmetatable(PlayerDetail, {__index = GSData})

	
		
-- A player's external identifiers
-- method type 5 - primitive return type
function PlayerDetail:getExternalIds()
	if self:getAttribute("externalIds") ~= nil then
		return self:getAttribute("externalIds")
  	end
	
  	return nil
  	
end
		
-- A player's id
-- method type 5 - primitive return type
function PlayerDetail:getId()
	if self:getAttribute("id") ~= nil then
		return self:getAttribute("id")
  	end
	
  	return nil
  	
end
		
-- A player's name
-- method type 5 - primitive return type
function PlayerDetail:getName()
	if self:getAttribute("name") ~= nil then
		return self:getAttribute("name")
  	end
	
  	return nil
  	
end

return PlayerDetail

