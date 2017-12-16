local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestsSendPayload = require("tests.RT.TestsSendPayload")

local TestsSendPayloadTCP = {}
local TestsSendPayloadTCP_mt = {__index = TestsSendPayloadTCP}

TestsSendPayloadTCP.mFinished = false

local writeText = nil

function TestsSendPayloadTCP.new()
  local instance = TestBase.new()
  
  return setmetatable(instance, TestsSendPayloadTCP_mt)
end

setmetatable(TestsSendPayloadTCP, {__index = TestBase})

function TestsSendPayloadTCP:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestsSendPayloadTCP => ")
  
  print("##############################################")
  print("### TestsSendPayloadTCP                    ###")
  print("##############################################")
  
  TestsSendPayload.launch(GameSparksRT.deliveryIntent.RELIABLE, function()
    writeText("PASSED!\n")
    
    TestsSendPayloadTCP.mFinished = true
  end,
  {"ZrEt6+6RfYui5GxI0ojaO79dbo7g4wuEmoLb1P4DKNvKlDEm5QJ0l5+xw8nm/vwYdjancpNkZiHZC588gbESOWjOYJO48k/baoHpw5RQe0VWq/WNB3qiLxJjBnxIdsdWj3+ybTCbWwiKGIKE5cv1diVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5IPuYpZ3n1ZLmbqDZC1F/mL9dbo7g4wuEmoLb1P4DKNtpQHl0CzeMLWDqYkI1fOJfLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "M3rrXQMnbeRLEIhnzj7ehr9dbo7g4wuEmoLb1P4DKNvKlDEm5QJ0l5+xw8nm/vwYdjancpNkZiHZC588gbESORaPcogMELGDua8SrUqpdn9Wq/WNB3qiLxJjBnxIdsdWj3+ybTCbWwiKGIKE5cv1diVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5IPuYpZ3n1ZLmbqDZC1F/mL9dbo7g4wuEmoLb1P4DKNtpQHl0CzeMLWDqYkI1fOJfLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
end

return TestsSendPayloadTCP