
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSData = require("gamesparks.GSData")
local GSUtils = require("gamesparks.GSUtils")



local InvitableFriend = {}
local InvitableFriend_mt = {__index = InvitableFriend}

function InvitableFriend.new(data)
  local instance = GSData.new(data)
  return setmetatable(instance, InvitableFriend_mt)
end

setmetatable(InvitableFriend, {__index = GSData})

	
		
-- The display name of the External Friend
-- method type 5 - primitive return type
function InvitableFriend:getDisplayName()
	if self:getAttribute("displayName") ~= nil then
		return self:getAttribute("displayName")
  	end
	
  	return nil
  	
end
		
-- The ID of the External Friend
-- method type 5 - primitive return type
function InvitableFriend:getId()
	if self:getAttribute("id") ~= nil then
		return self:getAttribute("id")
  	end
	
  	return nil
  	
end
		
-- The profile picture URL of the External Friend
-- method type 5 - primitive return type
function InvitableFriend:getProfilePic()
	if self:getAttribute("profilePic") ~= nil then
		return self:getAttribute("profilePic")
  	end
	
  	return nil
  	
end

return InvitableFriend

