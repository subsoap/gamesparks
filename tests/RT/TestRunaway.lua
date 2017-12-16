local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestRunaway = {}
local TestRunaway_mt = {__index = TestRunaway}

TestRunaway.mFinished = false

local writeText = nil

function TestRunaway.new()
  local instance = TestBase.new()
  
  instance.ctx = nil

  return setmetatable(instance, TestRunaway_mt)
end

setmetatable(TestRunaway, {__index = TestBase})

function TestRunaway:getScript()
  return "06_runaway"
end

function TestRunaway:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestRunaway => ")
  
  print("##############################################")
  print("### TestRunaway                            ###")
  print("##############################################")
  
  self.ctx = self:getTestContext(1, true, function()
    self.ctx.sessions[1].session:sendRTData(123, GameSparksRT.deliveryIntent.UNRELIABLE, nil)
    
    timer.seconds(2.0, function(event)
      self.ctx:stop()
      
      writeText("PASSED!\n")
      
      TestRunaway.mFinished = true
    end)
  end,
  {"Rr+e+kTO1IXWD85DD4/l+NwbgMkNoVbkINLK9Q/jMMKk8yJe+x/wMJGOLOjahMew7VwJbEWRCAL2wMdvzviukGjOYJO48k/baoHpw5RQe0VuC6nqUajCZGK98SgZBpvsNj5wr2XyJ2q67gyAC4s2gnX4Lcx13y9eX+cwOEbrykguXhzgI/oOvpmBHqVaJnlyB+9RlFcAQqmndMw6JdusI+Am61JACSxo4oR8HJPaBwS27rAcsonOLdVJHeP7Mhn6ZYLbeub6hSALrNeYqKY+YD1oCWH33KVFzGBHdw4BLaHWuUB/sMG0gqS0a68ZVhWkn9Q/BXp7PVr1WeWf7RH9IPezkOK/jER16LOh+Q1iCzv2iHedfVhoXHZt4PixAOZ2pFDS4ol8PItIOl0XHAJYtQ=="})
end

return TestRunaway