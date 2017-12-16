
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")



local PlayerMessage = {}
local PlayerMessage_mt = {__index = PlayerMessage}

function PlayerMessage.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, PlayerMessage_mt)
end

setmetatable(PlayerMessage, {__index = GSResponse})

	
		
-- The id of the message
-- method type 5 - primitive return type
function PlayerMessage:getId()
	if self:getAttribute("id") ~= nil then
		return self:getAttribute("id")
  	end
	
  	return nil
  	
end
		
-- The message content
-- method type 5 - primitive return type
function PlayerMessage:getMessage()
	if self:getAttribute("message") ~= nil then
		return self:getAttribute("message")
  	end
	
  	return nil
  	
end
		
-- Whether the message has been delivered to the client
-- method type 5 - primitive return type
function PlayerMessage:getSeen()
	if self:getAttribute("seen") ~= nil then
		return self:getAttribute("seen")
  	end
	
  	return false
  	
end
		
-- The status of the message
-- method type 5 - primitive return type
function PlayerMessage:getStatus()
	if self:getAttribute("status") ~= nil then
		return self:getAttribute("status")
  	end
	
  	return nil
  	
end
		
-- The date of the message
-- method type 5 - primitive return type
function PlayerMessage:getWhen()
	if self:getAttribute("when") ~= nil then
		return rfc3339toDate(self:getAttribute("when"));
  	end
	
  	return nil
  	
end

return PlayerMessage

