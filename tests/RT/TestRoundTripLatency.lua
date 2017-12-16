local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local GSUtils = require("gamesparks.GSUtils")

local TestRoundTripLatency = {}
local TestRoundTripLatency_mt = {__index = TestRoundTripLatency}

TestRoundTripLatency.mFinished = false

local writeText = nil
local timerID = nil

function TestRoundTripLatency.new()
  local instance = TestBase.new()
  
  instance.ctx = nil

  return setmetatable(instance, TestRoundTripLatency_mt)
end

setmetatable(TestRoundTripLatency, {__index = TestBase})

function TestRoundTripLatency:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestRoundTripLatency => ")
  
  print("##############################################")
  print("### TestRoundTripLatency                   ###")
  print("##############################################")
  
  self.ctx = self:getTestContext(2, true, function()
    self.ctx.sessions[2].onPacketCB = function(packet)
      local currentEpoch = self:epochTime()
      
      print(currentEpoch .. " " .. (currentEpoch - packet.data:getLong(1)))
    end
    
    local i = 0
    
    timerID = timer.repeating(0.03, function(event)
      if i < 10 then
        self.ctx.sessions[1].session:sendRTData(2, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, self:epochTime()))
      else
        self.ctx:stop()
  
        writeText("PASSED!\n")
    
        TestRoundTripLatency.mFinished = true
        
        timer.cancel(timerID)
      end
      i = i + 1
     
    end)
  end,
  {"LenlmS90dzU12+Bm0LAQ8AJP3arLubIaAVBSuSFavzTf48ktM+ehOcLWoTsfMBBUrbJsHe4Sc+k3GZ6HmJ7CMmjOYJO48k/baoHpw5RQe0WW73/9iw+5pvPrKM4W9hovj3+ybTCbWwiKGIKE5cv1diVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5QyToZjwaZ9xbyWZKXydYjQJP3arLubIaAVBSuSFavzQn/CbhrKBgJSZ7ovlswZ+rLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "9X69hr5Coz4amQY81o8tnQJP3arLubIaAVBSuSFavzTf48ktM+ehOcLWoTsfMBBUrbJsHe4Sc+k3GZ6HmJ7CMhaPcogMELGDua8SrUqpdn+W73/9iw+5pvPrKM4W9hovj3+ybTCbWwiKGIKE5cv1diVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5QyToZjwaZ9xbyWZKXydYjQJP3arLubIaAVBSuSFavzQn/CbhrKBgJSZ7ovlswZ+rLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
end

function TestRoundTripLatency:epochTime()
  return tonumber(getTime())
end

return TestRoundTripLatency