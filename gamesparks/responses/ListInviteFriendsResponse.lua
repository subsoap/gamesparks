
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local InvitableFriend = require("gamesparks.types.InvitableFriend")


local ListInviteFriendsResponse = {}
local ListInviteFriendsResponse_mt = {__index = ListInviteFriendsResponse}

function ListInviteFriendsResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, ListInviteFriendsResponse_mt)
end

setmetatable(ListInviteFriendsResponse, {__index = GSResponse})

	
		
-- A list of JSON objects containing game friend data
-- method type 1 - typed object array return type
function ListInviteFriendsResponse:getFriends()
	local ret = {}
	local friends = self:getAttribute("friends")
	
	if friends ~= nil then
		for a = 1, #friends do
	    	ret[a] = InvitableFriend.new(friends[a])
	    end
	end
	  
	return ret
end
			
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function ListInviteFriendsResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return ListInviteFriendsResponse

