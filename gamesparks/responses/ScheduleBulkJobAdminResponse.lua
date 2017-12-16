
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local ScheduleBulkJobAdminResponse = {}
local ScheduleBulkJobAdminResponse_mt = {__index = ScheduleBulkJobAdminResponse}

function ScheduleBulkJobAdminResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ScheduleBulkJobAdminResponse_mt)
end

setmetatable(ScheduleBulkJobAdminResponse, {__index = GSResponse})

	
		
-- The count of players who would be affected by this job if it ran at the time it was submitted
-- method type 5 - primitive return type
function ScheduleBulkJobAdminResponse:getEstimatedCount()
	if self:getAttribute("estimatedCount") ~= nil then
		return self:getAttribute("estimatedCount")
  	end
	
  	return math.nan
  	
end
		
-- The unique job ID, used to identify this job in future requests
-- method type 5 - primitive return type
function ScheduleBulkJobAdminResponse:getJobId()
	if self:getAttribute("jobId") ~= nil then
		return self:getAttribute("jobId")
  	end
	
  	return nil
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ScheduleBulkJobAdminResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return ScheduleBulkJobAdminResponse

