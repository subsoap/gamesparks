
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local BulkJob = require("gamesparks.types.BulkJob")


local CancelBulkJobAdminResponse = {}
local CancelBulkJobAdminResponse_mt = {__index = CancelBulkJobAdminResponse}

function CancelBulkJobAdminResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, CancelBulkJobAdminResponse_mt)
end

setmetatable(CancelBulkJobAdminResponse, {__index = GSResponse})

	
		
-- A list of JSON objects containing bulk jobs
-- method type 1 - typed object array return type
function CancelBulkJobAdminResponse:getBulkJobs()
	local ret = {}
	local bulkJobs = self:getAttribute("bulkJobs")
	
	if bulkJobs ~= nil then
		for a = 1, #bulkJobs do
	    	ret[a] = BulkJob.new(bulkJobs[a])
	    end
	end
	  
	return ret
end
			
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function CancelBulkJobAdminResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return CancelBulkJobAdminResponse

