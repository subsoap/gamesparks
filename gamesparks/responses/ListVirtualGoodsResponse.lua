
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local VirtualGood = require("gamesparks.types.VirtualGood")


local ListVirtualGoodsResponse = {}
local ListVirtualGoodsResponse_mt = {__index = ListVirtualGoodsResponse}

function ListVirtualGoodsResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ListVirtualGoodsResponse_mt)
end

setmetatable(ListVirtualGoodsResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ListVirtualGoodsResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A list of JSON objects containing virtual goods data
-- method type 1 - typed object array return type
function ListVirtualGoodsResponse:getVirtualGoods()
	local ret = {}
	local virtualGoods = self:getAttribute("virtualGoods")
	
	if virtualGoods ~= nil then
		for a = 1, #virtualGoods do
	    	ret[a] = VirtualGood.new(virtualGoods[a])
	    end
	end
	  
	return ret
end
			

return ListVirtualGoodsResponse

