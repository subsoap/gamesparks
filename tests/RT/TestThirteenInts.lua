local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestThirteenInts = {}
local TestThirteenInts_mt = {__index = TestThirteenInts}

TestThirteenInts.mFinished = false

local writeText = nil

function TestThirteenInts.new()
  local instance = TestBase.new()
  
  instance.ctx = nil

  return setmetatable(instance, TestThirteenInts_mt)
end

setmetatable(TestThirteenInts, {__index = TestBase})

function TestThirteenInts:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestThirteenInts => ")
  
  print("##############################################")
  print("### TestThirteenInts                       ###")
  print("##############################################")
  
  self.ctx = self:getTestContext(2, true, function()
    self.ctx.sessions[2].onPacketCB = function(packet)
      print(packet:toString())
    end

    local data = RTData.get()

    data:setString(1, "USER NAME")
    data:setLong(2, 1)
    data:setString(3, "TEAM NAME")

    local numIntsToSend = 14
    local index = 4
    
    data:setLong(index, numIntsToSend)
    index = index + 1

    for i = 1, numIntsToSend do
      data:setLong(index, 0)
      index = index + 1
    end
    
    self.ctx.sessions[1].session:sendRTData(120, GameSparksRT.deliveryIntent.RELIABLE, data)
    
    timer.seconds(2.0, function(event)
      self.ctx:stop()
    
      writeText("PASSED!\n")
      
      TestThirteenInts.mFinished = true
    end)
  end,
  {"pkwbmgz6A58EZ7Z0FCLLxT5hBhQz30rjdXQEDr48V6o4vsuuazVgfGtHeRGD9sPnm6zv0uJyVt4bz7Qdy+kSLWjOYJO48k/baoHpw5RQe0WmnLFweVS4PTGrg55S6DsBBNgNooZEadrFm9rihohK+SVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5IliZ3x3bbJbGd41YpuWeQz5hBhQz30rjdXQEDr48V6qiMUvNPOSc/OxzcS2wD6GCLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "41f9l635Ctd5frURueF2JT5hBhQz30rjdXQEDr48V6o4vsuuazVgfGtHeRGD9sPnm6zv0uJyVt4bz7Qdy+kSLRaPcogMELGDua8SrUqpdn+mnLFweVS4PTGrg55S6DsBBNgNooZEadrFm9rihohK+SVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5IliZ3x3bbJbGd41YpuWeQz5hBhQz30rjdXQEDr48V6qiMUvNPOSc/OxzcS2wD6GCLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
end

return TestThirteenInts