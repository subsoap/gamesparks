
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local PlayerTransaction = require("gamesparks.types.PlayerTransaction")


local ListTransactionsResponse = {}
local ListTransactionsResponse_mt = {__index = ListTransactionsResponse}

function ListTransactionsResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ListTransactionsResponse_mt)
end

setmetatable(ListTransactionsResponse, {__index = GSResponse})

	
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ListTransactionsResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A list of JSON objects containing player transactions
-- method type 1 - typed object array return type
function ListTransactionsResponse:getTransactionList()
	local ret = {}
	local transactionList = self:getAttribute("transactionList")
	
	if transactionList ~= nil then
		for a = 1, #transactionList do
	    	ret[a] = PlayerTransaction.new(transactionList[a])
	    end
	end
	  
	return ret
end
			

return ListTransactionsResponse

