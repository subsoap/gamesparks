
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local RevokePurchaseGoodsResponse = {}
local RevokePurchaseGoodsResponse_mt = {__index = RevokePurchaseGoodsResponse}

function RevokePurchaseGoodsResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, RevokePurchaseGoodsResponse_mt)
end

setmetatable(RevokePurchaseGoodsResponse, {__index = GSResponse})

	
		
-- The map of revoked goods
-- method type 5 - primitive return type
function RevokePurchaseGoodsResponse:getRevokedGoods()
	if self:getAttribute("revokedGoods") ~= nil then
		return self:getAttribute("revokedGoods")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function RevokePurchaseGoodsResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return RevokePurchaseGoodsResponse

