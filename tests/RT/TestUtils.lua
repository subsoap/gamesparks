local customjson = require("gamesparks.dmc_corona.lib.dmc_lua.json")
local crypto2 = require("crypto2.crypto2")
local TestSession = require("tests.RT.TestSession")

TestUtils = {}

local function getTime()
   local a,b = math.modf(os.clock())
   
   if b == 0 then 
      b = '000' 
   else 
      b = tostring(b):sub(3, 5) 
   end
   
   return tostring(os.time()) .. b
end

local guid = {}

guid.char = {"A", "B", "C", "D", "E", "F","1","2","3","4","5","6","7","8","9"}
guid.isHyphen = {[9]=1,[14]=1,[19]=1,[24]=1}
guid.used = {}
guid.loops = 0

math.randomseed(os.time())

function TestUtils.generateGUID()
    guid.currentGuid = nil;
    while(true) do
    guid.loops = guid.loops +1;
    --If we can't get it in 20 tries than we have bigger problems.
    --if(guid.loops > 20) then return false; end
    guid.pass = {};
        for z = 1,36 do
            if guid.isHyphen[z] then
                guid.x='-';
            else
                guid.a = math.random(1,#guid.char); -- randomly choose a character from the "guid.char" array
                guid.x = guid.char[guid.a]
            end
                table.insert(guid.pass, guid.x) -- add new index into array.
        end
        z = nil
        guid.currentGuid = tostring(table.concat(guid.pass)); -- concatenate all indicies of the array, then return concatenation.
        if not guid.used[guid.currentGuid] then

            guid.used[guid.currentGuid] = guid.currentGuid;
            return(guid.currentGuid);
        else
            --print('Duplicated a Previously Created GUID.');
        end
    end
    
    return ""
end

function TestUtils.getSessions(sessionCount, apiKey, secret, rtServer, port, cluster, script, version, _tokens)
  local playerIds = {}

  for i = 1, sessionCount do
    playerIds[i] = "gsplayerid" .. tostring(i)
  end
  
  local tokens = TestUtils.getToken(playerIds, apiKey, secret, rtServer .. ":" .. port, cluster, script, version, _tokens)
  
  local sessions = {}

  for i = 1, #playerIds do
    print(tokens[i])
    
    sessions[i] = TestSession.new(tokens[i], rtServer .. ":" .. port, port, playerIds[i])
  end

  return sessions
end

function TestUtils.getToken(playerIds, apiKey, secret, rtServer, cluster, script, version, tokens)
  local ret = {}
  local secondsSinceEpoch = tonumber(getTime())
  local matchId = TestUtils.generateGUID()
  
  for i = 1, #playerIds do
    local dict = {}

    dict["peerId"] = i
    dict["matchId"] = matchId
    dict["ts"] = secondsSinceEpoch
    dict["apiKey"] = apiKey
    dict["playerId"] = playerIds[i]
    dict["rtServer"] = rtServer
    dict["cluster"] = cluster

    if script ~= nil then
      dict["script"] = script
    end
    if version > 0 then
      dict["scriptVersion"] = version
    end
    
    local encoded = customjson.encode(dict)
    
    local jsonWithPipeSeparated = tostring(i) .. "|" .. tostring(matchId) .. "|" .. secondsSinceEpoch .. "|" .. encoded
    
    if tokens ~= nil then
    	ret[i] = tokens[i]
    else
    	encoded = TestUtils.encryptToken(jsonWithPipeSeparated, secret)
    	ret[i] = encoded
    end
  end
  
  return ret
end

function TestUtils.encryptToken(token, base64EncodedSecret)
  local secret = mime.unb64(base64EncodedSecret)
  
  return mime.b64(crypto2.encrypt(token, secret))
end

function TestUtils.contains(table, item)
  for key, value in pairs(table) do
    if table[key] == item then 
      return true
    end
  end
  
  return false
end

function TestUtils.remove(table, item)
  for key, value in pairs(table) do
    if table[key] == item then 
      table[key] = nil
      
      return
    end
  end
end

function TestUtils.round(num, numDecimalPlaces)
  local mult = 10 ^ (numDecimalPlaces or 0)
  
  return math.floor(num * mult + 0.5) / mult
end

return TestUtils