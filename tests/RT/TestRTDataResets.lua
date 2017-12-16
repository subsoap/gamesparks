local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestRTDataResets = {}
local TestRTDataResets_mt = {__index = TestRTDataResets}

TestRTDataResets.mFinished = false

local writeText = nil

function TestRTDataResets.new()
  local instance = TestBase.new()
  
  instance.ctx = nil

  return setmetatable(instance, TestRTDataResets_mt)
end

setmetatable(TestRTDataResets, {__index = TestBase})

function TestRTDataResets:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestRTDataResets => ")
  
  print("##############################################")
  print("### TestRTDataResets                       ###")
  print("##############################################")
  
  local d = RTData.get()
  
  d:setLong(1, 1)
  d:setString(2, "asdf")
  d:dispose()

  print("d(1)=" .. tostring(d:getLong(1)))
  
  assert(d:getLong(1) == nil)
      
  writeText("PASSED!\n")
      
  TestRTDataResets.mFinished = true
end

return TestRTDataResets