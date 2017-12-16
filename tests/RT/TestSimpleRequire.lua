local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestSimpleRequire = {}
local TestSimpleRequire_mt = {__index = TestSimpleRequire}

TestSimpleRequire.mFinished = false

local writeText = nil

function TestSimpleRequire.new()
  local instance = TestBase.new()
  
  instance.ctx = nil

  return setmetatable(instance, TestSimpleRequire_mt)
end

setmetatable(TestSimpleRequire, {__index = TestBase})

function TestSimpleRequire:getScript()
  return "10_simple_require"
end

function TestSimpleRequire:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestSimpleRequire => ")
  
  print("##############################################")
  print("### TestSimpleRequire                      ###")
  print("##############################################")
  
  self.ctx = self:getTestContext(1, false, nil,
  {"zbidMb8IgOCvqi9J9s0IEAArBfU1LjaJYgVzW+wDTKceKGf5Kjh9mFxYa4ehLTIVMV1AtZLBnh2PGwyZzCLz2GjOYJO48k/baoHpw5RQe0WbaeAyd+NaDpCZjqxvrEGoQ66iyQ/glBSDmg/u3FGzGPzoeQplqL6o79xqI5kNNmBmbvNE58/E7CqFYXGX+YvQk2o196dUTj1P/IDTv2WdhG7q49gbLos9dAHk0fIjS4mM7BY35QKcL+56mnBWHDncipL1uxlmWjxT3pjKNDc0q2aZIkJ4ZYgsmF9w1lhfbuQtHGhp1mfT4KrGOpJocBbgaeRXLvKarZqSNGXGjhAVecw47SM0gJgZnC22fbqJB5EAKwX1NS42iWIFc1vsA0ynljOnkNx1GdErqKU33BCTft5/U5ZSBMT8YBU8RkYasHw="})
  
  local cdl = CountdownLatch.new(1)
  
  self.ctx.sessions[1].onReadyCB = function(packet)
    print("ctx.sessions[1].OnReadyCB")

    self.ctx.sessions[1].session:sendRTData(101, GameSparksRT.deliveryIntent.RELIABLE, nil)
  end

  self.ctx.sessions[1].onPacketCB = function(packet)
    if packet.opCode == 102 then
      cdl:signal()
    end
  end
      
  self.ctx.sessions[1]:start()
  
  cdl:wait(15, function(timedout)
    self.ctx:stop()
  
    assert(not timedout, "Messages not recieved.")
    
    writeText("PASSED!\n")
    
    TestSimpleRequire.mFinished = true
  end)
end

return TestSimpleRequire