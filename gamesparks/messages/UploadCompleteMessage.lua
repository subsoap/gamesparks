
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local UploadData = require("gamesparks.types.UploadData")


local UploadCompleteMessage = {}
local UploadCompleteMessage_mt = {__index = UploadCompleteMessage}

function UploadCompleteMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, UploadCompleteMessage_mt)
end

setmetatable(UploadCompleteMessage, {__index = GSResponse})

	
		
-- A unique identifier for this message.
-- method type 5 - primitive return type
function UploadCompleteMessage:getMessageId()
	if self:getAttribute("messageId") ~= nil then
		return self:getAttribute("messageId")
  	end
	
  	return nil
  	
end
		
-- Flag indicating whether this message could be sent as a push notification or not.
-- method type 5 - primitive return type
function UploadCompleteMessage:getNotification()
	if self:getAttribute("notification") ~= nil then
		return self:getAttribute("notification")
  	end
	
  	return false
  	
end
		
-- ScriptData is arbitrary data that can be stored in a message by a Cloud Code script.
-- method type 5 - primitive return type
function UploadCompleteMessage:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function UploadCompleteMessage:getSubTitle()
	if self:getAttribute("subTitle") ~= nil then
		return self:getAttribute("subTitle")
  	end
	
  	return nil
  	
end
		
-- A textual summary describing the message's purpose.
-- method type 5 - primitive return type
function UploadCompleteMessage:getSummary()
	if self:getAttribute("summary") ~= nil then
		return self:getAttribute("summary")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function UploadCompleteMessage:getTitle()
	if self:getAttribute("title") ~= nil then
		return self:getAttribute("title")
  	end
	
  	return nil
  	
end
		
-- The upload data (if supplied as part of GetUploadUrlRequest) of UploadData objects
-- method type 2 - typed object return type
function UploadCompleteMessage:getUploadData()
	if self:getAttribute("uploadData") ~= nil then
		return UploadData.new(self:getAttribute("uploadData"))
	end
	  
	return nil
end		
				
		
-- The id of the upload
-- method type 5 - primitive return type
function UploadCompleteMessage:getUploadId()
	if self:getAttribute("uploadId") ~= nil then
		return self:getAttribute("uploadId")
  	end
	
  	return nil
  	
end

return UploadCompleteMessage

