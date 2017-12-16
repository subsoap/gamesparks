local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestsSendRTData = require("tests.RT.TestsSendRTData")

local TestsSendRTDataUDPSEQUENCED = {}
local TestsSendRTDataUDPSEQUENCED_mt = {__index = TestsSendRTDataUDPSEQUENCED}

TestsSendRTDataUDPSEQUENCED.mFinished = false

local writeText = nil

function TestsSendRTDataUDPSEQUENCED.new()
  local instance = TestBase.new()
  
  return setmetatable(instance, TestsSendRTDataUDPSEQUENCED_mt)
end

setmetatable(TestsSendRTDataUDPSEQUENCED, {__index = TestBase})

function TestsSendRTDataUDPSEQUENCED:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestsSendRTDataUDPSEQUENCED => ")
  
  print("##############################################")
  print("### TestsSendRTDataUDPSEQUENCED            ###")
  print("##############################################")
  
  TestsSendRTData.launch(GameSparksRT.deliveryIntent.UNRELIABLE_SEQUENCED, function()
    writeText("PASSED!\n")
    
    TestsSendRTDataUDPSEQUENCED.mFinished = true
  end,
  {"zjXZ3m+/c5LV3auLPoiRNTm8AHoyLhrKxHlhSgMdnU5Ut7QWxZRadx9ZZJbHBjfwJjmxpMTrMNTCishElOxHRGjOYJO48k/baoHpw5RQe0UOjuzfD5leeWcf36Lu5+3GofCGZAh209fCfaqJTEdJxyVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5iV8UgyUJENtuy5e+j8o5ZTm8AHoyLhrKxHlhSgMdnU63CyBdHe+Xz3578Y3NRGztLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "IWi9FI9OmqTD6zZDytV1oDm8AHoyLhrKxHlhSgMdnU5Ut7QWxZRadx9ZZJbHBjfwJjmxpMTrMNTCishElOxHRBaPcogMELGDua8SrUqpdn8OjuzfD5leeWcf36Lu5+3GofCGZAh209fCfaqJTEdJxyVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5iV8UgyUJENtuy5e+j8o5ZTm8AHoyLhrKxHlhSgMdnU63CyBdHe+Xz3578Y3NRGztLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
end

return TestsSendRTDataUDPSEQUENCED