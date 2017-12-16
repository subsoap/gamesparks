local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestsSendPayload = require("tests.RT.TestsSendPayload")

local TestsSendPayloadUDP = {}
local TestsSendPayloadUDP_mt = {__index = TestsSendPayloadUDP}

TestsSendPayloadUDP.mFinished = false

local writeText = nil

function TestsSendPayloadUDP.new()
  local instance = TestBase.new()
  
  return setmetatable(instance, TestsSendPayloadUDP_mt)
end

setmetatable(TestsSendPayloadUDP, {__index = TestBase})

function TestsSendPayloadUDP:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestsSendPayloadUDP => ")
  
  print("##############################################")
  print("### TestsSendPayloadUDP                    ###")
  print("##############################################")
  
  TestsSendPayload.launch(GameSparksRT.deliveryIntent.UNRELIABLE, function()
    writeText("PASSED!\n")
    
    TestsSendPayloadUDP.mFinished = true
  end,
  {"s7RKTeiLbPlljK9xrqXwm+hmmOdIDTaTcKnpLhPA7E3jV1ybRHmgiavt6vy+PWlxhLCgYiFJYV9dayq+YQQAkmjOYJO48k/baoHpw5RQe0U0mbAS+2vRE99lngWDUsP4BHdV+87pgS0XjmBSChAnjyVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5YNr9je6H5YMK/1/ModNg1ehmmOdIDTaTcKnpLhPA7E2YCiy3ZdGqve2ahjM3vi6ULl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "M6FiGc/W9uf1DSZkpyPugehmmOdIDTaTcKnpLhPA7E3jV1ybRHmgiavt6vy+PWlxhLCgYiFJYV9dayq+YQQAkhaPcogMELGDua8SrUqpdn80mbAS+2vRE99lngWDUsP4BHdV+87pgS0XjmBSChAnjyVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5YNr9je6H5YMK/1/ModNg1ehmmOdIDTaTcKnpLhPA7E2YCiy3ZdGqve2ahjM3vi6ULl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
end

return TestsSendPayloadUDP