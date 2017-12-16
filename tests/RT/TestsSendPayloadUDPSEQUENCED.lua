local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestsSendPayload = require("tests.RT.TestsSendPayload")

local TestsSendPayloadUDPSEQUENCED = {}
local TestsSendPayloadUDPSEQUENCED_mt = {__index = TestsSendPayloadUDPSEQUENCED}

TestsSendPayloadUDPSEQUENCED.mFinished = false

local writeText = nil

function TestsSendPayloadUDPSEQUENCED.new()
  local instance = TestBase.new()
  
  return setmetatable(instance, TestsSendPayloadUDPSEQUENCED_mt)
end

setmetatable(TestsSendPayloadUDPSEQUENCED, {__index = TestBase})

function TestsSendPayloadUDPSEQUENCED:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestsSendPayloadUDPSEQUENCED => ")
  
  print("##############################################")
  print("### TestsSendPayloadUDPSEQUENCED           ###")
  print("##############################################")
  
  TestsSendPayload.launch(GameSparksRT.deliveryIntent.UNRELIABLE_SEQUENCED, function()
    writeText("PASSED!\n")
    
    TestsSendPayloadUDPSEQUENCED.mFinished = true
  end,
  {"8TdJUnDpu9YYV24XVL+NETf33xyTulsgdbf5uJ3Fu8cY3SzGD/raJvG/d0euaiY2R0zXAVbtWHvwd5K7O5wr2WjOYJO48k/baoHpw5RQe0Xsl4aLA5vkfkcR1/64g52h2OIYxczc35l1y4TjuxXeziVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5lWYOhE/rxagE5K0eZMibCDf33xyTulsgdbf5uJ3Fu8eqWBwfl7M6M+Ma9JhQyJAbLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "Z7KkgCy+lYj/W2ny8F7CTjf33xyTulsgdbf5uJ3Fu8cY3SzGD/raJvG/d0euaiY2R0zXAVbtWHvwd5K7O5wr2RaPcogMELGDua8SrUqpdn/sl4aLA5vkfkcR1/64g52h2OIYxczc35l1y4TjuxXeziVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5lWYOhE/rxagE5K0eZMibCDf33xyTulsgdbf5uJ3Fu8eqWBwfl7M6M+Ma9JhQyJAbLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
end

return TestsSendPayloadUDPSEQUENCED