local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestsSendRTData = require("tests.RT.TestsSendRTData")

local TestsSendRTDataTCP = {}
local TestsSendRTDataTCP_mt = {__index = TestsSendRTDataTCP}

TestsSendRTDataTCP.mFinished = false

local writeText = nil

function TestsSendRTDataTCP.new()
  local instance = TestBase.new()
  
  return setmetatable(instance, TestsSendRTDataTCP_mt)
end

setmetatable(TestsSendRTDataTCP, {__index = TestBase})

function TestsSendRTDataTCP:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestsSendRTDataTCP => ")
  
  print("##############################################")
  print("### TestsSendRTDataTCP                     ###")
  print("##############################################")
  
  TestsSendRTData.launch(GameSparksRT.deliveryIntent.RELIABLE, function()
    writeText("PASSED!\n")
    
    TestsSendRTDataTCP.mFinished = true
  end,
  {"5Hc4qXFBjXWSThO13qm11QjDEexjzXpuVVw8fkUg/oMxFvnlWzWn/+DZiDyxpZiq3LqZ823I5xRNg0ULvKnpPWjOYJO48k/baoHpw5RQe0W6fp2XU3T8+1oDcOKXStoGBHdV+87pgS0XjmBSChAnjyVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5qR0Pyvqol2W3Ql8Z9rmaFgjDEexjzXpuVVw8fkUg/oPop7s9GQHIxHIad78NGxhJLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "/6kNj57ASWWkrB/5nprXLwjDEexjzXpuVVw8fkUg/oMxFvnlWzWn/+DZiDyxpZiq3LqZ823I5xRNg0ULvKnpPRaPcogMELGDua8SrUqpdn+6fp2XU3T8+1oDcOKXStoGBHdV+87pgS0XjmBSChAnjyVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5qR0Pyvqol2W3Ql8Z9rmaFgjDEexjzXpuVVw8fkUg/oPop7s9GQHIxHIad78NGxhJLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
end

return TestsSendRTDataTCP