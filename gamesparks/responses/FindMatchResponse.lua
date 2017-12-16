
--THIS FILE IS AUTO GENERATED, DO NOT MODIFY!!


local GSResponse = require("gamesparks.GSResponse")
local GSUtils = require("gamesparks.GSUtils")

local Player = require("gamesparks.types.Player")


local FindMatchResponse = {}
local FindMatchResponse_mt = {__index = FindMatchResponse}

function FindMatchResponse.new(data)
  local instance = GSResponse.new(data)
  return setmetatable(instance, FindMatchResponse_mt)
end

setmetatable(FindMatchResponse, {__index = GSResponse})

	
		
-- The accessToken used to authenticate this player for this match
-- method type 5 - primitive return type
function FindMatchResponse:getAccessToken()
	if self:getAttribute("accessToken") ~= nil then
		return self:getAttribute("accessToken")
  	end
	
  	return nil
  	
end
		
-- The host to connect to for this match
-- method type 5 - primitive return type
function FindMatchResponse:getHost()
	if self:getAttribute("host") ~= nil then
		return self:getAttribute("host")
  	end
	
  	return nil
  	
end
		
-- MatchData is arbitrary data that can be stored in a Match instance by a Cloud Code script.
-- method type 5 - primitive return type
function FindMatchResponse:getMatchData()
	if self:getAttribute("matchData") ~= nil then
		return self:getAttribute("matchData")
  	end
	
  	return nil
  	
end
		
-- The id for this match instance
-- method type 5 - primitive return type
function FindMatchResponse:getMatchId()
	if self:getAttribute("matchId") ~= nil then
		return self:getAttribute("matchId")
  	end
	
  	return nil
  	
end
		
-- The opponents this player has been matched against
-- method type 1 - typed object array return type
function FindMatchResponse:getOpponents()
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
function FindMatchResponse:getPeerId()
	if self:getAttribute("peerId") ~= nil then
		return self:getAttribute("peerId")
  	end
	
  	return math.nan
  	
end
		
-- The id of the current player
-- method type 5 - primitive return type
function FindMatchResponse:getPlayerId()
	if self:getAttribute("playerId") ~= nil then
		return self:getAttribute("playerId")
  	end
	
  	return nil
  	
end
		
-- The port to connect to for this match
-- method type 5 - primitive return type
function FindMatchResponse:getPort()
	if self:getAttribute("port") ~= nil then
		return self:getAttribute("port")
  	end
	
  	return math.nan
  	
end
		
-- A JSON Map of any data added either to the Request or the Response by your Cloud Code
-- method type 5 - primitive return type
function FindMatchResponse:getScriptData()
	if self:getAttribute("scriptData") ~= nil then
		return self:getAttribute("scriptData")
  	end
	
  	return nil
  	
end

return FindMatchResponse

