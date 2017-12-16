
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local ScriptMessage = {}
local ScriptMessage_mt = {__index = ScriptMessage}

function ScriptMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ScriptMessage_mt)
end

setmetatable(ScriptMessage, {__index = GSResponse})

	
		
-- JSON data sent from a Cloud Code script.
-- method type 5 - primitive return type
function ScriptMessage:getData()
	if self:getAttribute("data") ~= nil then
		return self:getAttribute("data")
  	end
	
  	return nil
  	
end
		
-- The extension code used when creating this script message
-- method type 5 - primitive return type
function ScriptMessage:getExtCode()
	if self:getAttribute("extCode") ~= nil then
		return self:getAttribute("extCode")
  	end
	
  	return nil
  	
end
		
-- A unique identifier for this message.
-- method type 5 - primitive return type
function ScriptMessage:getMessageId()
	if self:getAttribute("messageId") ~= nil then
		return self:getAttribute("messageId")
  	end
	
  	return nil
  	
end
		
-- Flag indicating whether this message could be sent as a push notification or not.
-- method type 5 - primitive return type
function ScriptMessage:getNotification()
	if self:getAttribute("notification") ~= nil then
		return self:getAttribute("notification")
  	end
	
  	return false
  	
end
		
-- ScriptData is arbitrary data that can be stored in a message by a Cloud Code script.
-- method type 5 - primitive return type
function ScriptMessage:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function ScriptMessage:getSubTitle()
	if self:getAttribute("subTitle") ~= nil then
		return self:getAttribute("subTitle")
  	end
	
  	return nil
  	
end
		
-- A textual summary describing the message's purpose.
-- method type 5 - primitive return type
function ScriptMessage:getSummary()
	if self:getAttribute("summary") ~= nil then
		return self:getAttribute("summary")
  	end
	
  	return nil
  	
end
		
-- A textual title for the message.
-- method type 5 - primitive return type
function ScriptMessage:getTitle()
	if self:getAttribute("title") ~= nil then
		return self:getAttribute("title")
  	end
	
  	return nil
  	
end

return ScriptMessage

