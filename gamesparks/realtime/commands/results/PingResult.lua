--GameSparksRT = GameSparksRT or require("gamesparks.realtime.GameSparksRT")
AbstractResult = AbstractResult or require("gamesparks.realtime.commands.results.AbstractResult")
ObjectPool = ObjectPool or require("gamesparks.realtime.pools.ObjectPool")
ProtocolParser = ProtocolParser or require("gamesparks.realtime.proto.ProtocolParser")
require("gamesparks.GSUtils")

local PingResult = {}
local PingResult_mt = {__index = PingResult}
    
PingResult.pool = ObjectPool.new(function()
  return PingResult.new()
end, nil, 5)

function PingResult.new()
  local instance = AbstractResult.new()
  
  return setmetatable(instance, PingResult_mt)
end

setmetatable(PingResult, {__index = AbstractResult})

function PingResult:execute()
  self.session:log("PingResult", GameSparksRT.LogLevel.DEBUG, "")
  
  PingResult.pool:push(self)
end

function PingResult:executeAsync()
  return false
end

function PingResult.deserialize(stream, instance)  
  while true do
    local keyByte = stream:readByte()
    
    if keyByte == -1 then
      break
    end
    
    local key = ProtocolParser.readKey(keyByte, stream)

    if key.field == 0 then
      print("WARNING: " .. "Invalid field id: 0, something went wrong in the stream")
      
      break
    else
      if ProtocolParser.skipKey(stream, key) ~= true then
        break
      end
    end
  end

  return instance
end

return PingResult
  
