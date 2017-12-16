
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Player = require("gamesparks.types.Player")


local MatchDetailsResponse = {}
local MatchDetailsResponse_mt = {__index = MatchDetailsResponse}

function MatchDetailsResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, MatchDetailsResponse_mt)
end

setmetatable(MatchDetailsResponse, {__index = GSResponse})

	
		
-- The accessToken used to authenticate this player for this match
-- method type 5 - primitive return type
function MatchDetailsResponse:getAccessToken()
	if self:getAttribute("accessToken") ~= nil then
		return self:getAttribute("accessToken")
  	end
	
  	return nil
  	
end
		
-- The host to connect to for this match
-- method type 5 - primitive return type
function MatchDetailsResponse:getHost()
	if self:getAttribute("host") ~= nil then
		return self:getAttribute("host")
  	end
	
  	return nil
  	
end
		
-- MatchData is arbitrary data that can be stored in a Match instance by a Cloud Code script.
-- method type 5 - primitive return type
function MatchDetailsResponse:getMatchData()
	if self:getAttribute("matchData") ~= nil then
		return self:getAttribute("matchData")
  	end
	
  	return nil
  	
end
		
-- The id for this match instance
-- method type 5 - primitive return type
function MatchDetailsResponse:getMatchId()
	if self:getAttribute("matchId") ~= nil then
		return self:getAttribute("matchId")
  	end
	
  	return nil
  	
end
		
-- The opponents this player has been matched against
-- method type 1 - typed object array return type
function MatchDetailsResponse:getOpponents()
	local ret = {}
	local opponents = self:getAttribute("opponents")
	
	if opponents ~= nil then
		for a = 1, #opponents do
	    	ret[a] = Player.new(opponents[a])
	    end
	end
	  
	return ret
end
			
		
-- The peerId of this player within the match
-- method type 5 - primitive return type
function MatchDetailsResponse:getPeerId()
	if self:getAttribute("peerId") ~= nil then
		return self:getAttribute("peerId")
  	end
	
  	return math.nan
  	
end
		
-- The id of the current player
-- method type 5 - primitive return type
function MatchDetailsResponse:getPlayerId()
	if self:getAttribute("playerId") ~= nil then
		return self:getAttribute("playerId")
  	end
	
  	return nil
  	
end
		
-- The port to connect to for this match
-- method type 5 - primitive return type
function MatchDetailsResponse:getPort()
	if self:getAttribute("port") ~= nil then
		return self:getAttribute("port")
  	end
	
  	return math.nan
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function MatchDetailsResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return MatchDetailsResponse

