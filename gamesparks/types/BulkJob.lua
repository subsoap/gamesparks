
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local BulkJob = {}
local BulkJob_mt = {__index = BulkJob}

function BulkJob.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, BulkJob_mt)
end

setmetatable(BulkJob, {__index = GSData})

	
		
-- The actual count of players affected by the bulk job (calculated when the job started to run)
-- method type 5 - primitive return type
function BulkJob:getActualCount()
	if self:getAttribute("actualCount") ~= nil then
		return self:getAttribute("actualCount")
  	end
	
  	return math.nan
  	
end
		
-- The time at which the bulk job completed execution
-- method type 5 - primitive return type
function BulkJob:getCompleted()
	if self:getAttribute("completed") ~= nil then
		return rfc3339toDate(self:getAttribute("completed"));
  	end
	
  	return nil
  	
end
		
-- The time at which the bulk job was created
-- method type 5 - primitive return type
function BulkJob:getCreated()
	if self:getAttribute("created") ~= nil then
		return rfc3339toDate(self:getAttribute("created"));
  	end
	
  	return nil
  	
end
		
-- Data to be passed into the Module or Script
-- method type 5 - primitive return type
function BulkJob:getData()
	if self:getAttribute("data") ~= nil then
		return self:getAttribute("data")
  	end
	
  	return nil
  	
end
		
-- The number of players processed by the bulk job so far
-- method type 5 - primitive return type
function BulkJob:getDoneCount()
	if self:getAttribute("doneCount") ~= nil then
		return self:getAttribute("doneCount")
  	end
	
  	return math.nan
  	
end
		
-- The number of errors encountered whilst running the Module or Script for players
-- method type 5 - primitive return type
function BulkJob:getErrorCount()
	if self:getAttribute("errorCount") ~= nil then
		return self:getAttribute("errorCount")
  	end
	
  	return math.nan
  	
end
		
-- The estimated count of players affected by the bulk job (estimated when the job was submitted)
-- method type 5 - primitive return type
function BulkJob:getEstimatedCount()
	if self:getAttribute("estimatedCount") ~= nil then
		return self:getAttribute("estimatedCount")
  	end
	
  	return math.nan
  	
end
		
-- The ID for the bulk job
-- method type 5 - primitive return type
function BulkJob:getId()
	if self:getAttribute("id") ~= nil then
		return self:getAttribute("id")
  	end
	
  	return nil
  	
end
		
-- The Cloud Code Module to run for each player
-- method type 5 - primitive return type
function BulkJob:getModuleShortCode()
	if self:getAttribute("moduleShortCode") ~= nil then
		return self:getAttribute("moduleShortCode")
  	end
	
  	return nil
  	
end
		
-- The query to identify players to perform the bulk job on
-- method type 5 - primitive return type
function BulkJob:getPlayerQuery()
	if self:getAttribute("playerQuery") ~= nil then
		return self:getAttribute("playerQuery")
  	end
	
  	return nil
  	
end
		
-- The time at which the job was scheduled to run
-- method type 5 - primitive return type
function BulkJob:getScheduledTime()
	if self:getAttribute("scheduledTime") ~= nil then
		return rfc3339toDate(self:getAttribute("scheduledTime"));
  	end
	
  	return nil
  	
end
		
-- The Cloud Code script to run for each player
-- method type 5 - primitive return type
function BulkJob:getScript()
	if self:getAttribute("script") ~= nil then
		return self:getAttribute("script")
  	end
	
  	return nil
  	
end
		
-- The time at which the bulk job started to execute
-- method type 5 - primitive return type
function BulkJob:getStarted()
	if self:getAttribute("started") ~= nil then
		return rfc3339toDate(self:getAttribute("started"));
  	end
	
  	return nil
  	
end
		
-- The current state of the bulk job
-- method type 5 - primitive return type
function BulkJob:getState()
	if self:getAttribute("state") ~= nil then
		return self:getAttribute("state")
  	end
	
  	return nil
  	
end

return BulkJob

