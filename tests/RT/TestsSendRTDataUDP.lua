local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestsSendRTData = require("tests.RT.TestsSendRTData")

local TestsSendRTDataUDP = {}
local TestsSendRTDataUDP_mt = {__index = TestsSendRTDataUDP}

TestsSendRTDataUDP.mFinished = false

local writeText = nil

function TestsSendRTDataUDP.new()
  local instance = TestBase.new()
  
  return setmetatable(instance, TestsSendRTDataUDP_mt)
end

setmetatable(TestsSendRTDataUDP, {__index = TestBase})

function TestsSendRTDataUDP:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestsSendRTDataUDP => ")
  
  print("##############################################")
  print("### TestsSendRTDataUDP                     ###")
  print("##############################################")
  
  TestsSendRTData.launch(GameSparksRT.deliveryIntent.UNRELIABLE, function()
    writeText("PASSED!\n")
    
    TestsSendRTDataUDP.mFinished = true
  end,
  {"S7wDgeheLvTemaEUtz8dgSyOCfYQ2IMCpfmogL+iS6IqSvhvayATjjSstK4lATfehRDa9ExkjqoZtJO8Zb917GjOYJO48k/baoHpw5RQe0V99hbYOo0emQNOUFGMxUPyBHdV+87pgS0XjmBSChAnjyVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5WoU/qS92b8RKQ1TG7QWTOSyOCfYQ2IMCpfmogL+iS6JPXnRd9hYfDrKCwXIwaNTRLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "noXDRm7CXGsExV7iEVqPCSyOCfYQ2IMCpfmogL+iS6IqSvhvayATjjSstK4lATfehRDa9ExkjqoZtJO8Zb917BaPcogMELGDua8SrUqpdn999hbYOo0emQNOUFGMxUPyBHdV+87pgS0XjmBSChAnjyVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5WoU/qS92b8RKQ1TG7QWTOSyOCfYQ2IMCpfmogL+iS6JPXnRd9hYfDrKCwXIwaNTRLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
end

return TestsSendRTDataUDP