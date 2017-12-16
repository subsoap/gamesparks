local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestsSessionsDoBasicCommunication = require("tests.RT.TestsSessionsDoBasicCommunication")

local TestsSessionsDoBasicCommunicationUDPSEQUENCED = {}
local TestsSessionsDoBasicCommunicationUDPSEQUENCED_mt = {__index = TestsSessionsDoBasicCommunicationUDPSEQUENCED}

TestsSessionsDoBasicCommunicationUDPSEQUENCED.mFinished = false

local writeText = nil

function TestsSessionsDoBasicCommunicationUDPSEQUENCED.new()
  local instance = TestBase.new()

  return setmetatable(instance, TestsSessionsDoBasicCommunicationUDPSEQUENCED_mt)
end

setmetatable(TestsSessionsDoBasicCommunicationUDPSEQUENCED, {__index = TestBase})

function TestsSessionsDoBasicCommunicationUDPSEQUENCED:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestsSessionsDoBasicCommunicationUDPSEQUENCED => ")
  
  print("##############################################")
  print("### TestsSessionsDoBasicCommunicationUDPSEQ###")
  print("##############################################")
  
  TestsSessionsDoBasicCommunication.launch(GameSparksRT.deliveryIntent.UNRELIABLE_SEQUENCED, function()
    writeText("PASSED!\n")
    
    TestsSessionsDoBasicCommunicationUDPSEQUENCED.mFinished = true
  end,
  {"4IcZsSejm3GoVhZxmNRyTIza/wh/pIgINnK4peLBgoIP3yHrPh3pQuEAAwGxa8sA4BrhR+LQd1bLoMhAUiRDomjOYJO48k/baoHpw5RQe0W4Tb5dJ3esPaHRZDQ21DEC2OIYxczc35l1y4TjuxXeziVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5/GIceKID1q6/uq18lfUrKIza/wh/pIgINnK4peLBgoIe54Rto5TIFW58gZosH36jLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "DVTp5cpILy/MMRfxwWaQd4za/wh/pIgINnK4peLBgoIP3yHrPh3pQuEAAwGxa8sA4BrhR+LQd1bLoMhAUiRDohaPcogMELGDua8SrUqpdn+4Tb5dJ3esPaHRZDQ21DEC2OIYxczc35l1y4TjuxXeziVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5/GIceKID1q6/uq18lfUrKIza/wh/pIgINnK4peLBgoIe54Rto5TIFW58gZosH36jLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "ldFazA/XawZZqj2sOPm6u4za/wh/pIgINnK4peLBgoIP3yHrPh3pQuEAAwGxa8sA4BrhR+LQd1bLoMhAUiRDoianzlW3uAqck8Ivc74NMLG4Tb5dJ3esPaHRZDQ21DEC2OIYxczc35l1y4TjuxXeziVphxXy8favOb+bz+7hgCU2CAf0rR1MwIVhUvsjF36xhVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5/GIceKID1q6/uq18lfUrKIza/wh/pIgINnK4peLBgoIe54Rto5TIFW58gZosH36jLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "bv2OZ54w9F3bMJAniTHQT4za/wh/pIgINnK4peLBgoIP3yHrPh3pQuEAAwGxa8sA4BrhR+LQd1bLoMhAUiRDoswAPE8vj0jlQQ5bYbRejJ64Tb5dJ3esPaHRZDQ21DEC2OIYxczc35l1y4TjuxXeziVphxXy8favOb+bz+7hgCVpmW6rm0PCAros1mmWevkUhVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5/GIceKID1q6/uq18lfUrKIza/wh/pIgINnK4peLBgoIe54Rto5TIFW58gZosH36jLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
end

return TestsSessionsDoBasicCommunicationUDPSEQUENCED