local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestSessionsBecomeReadyIfStarted = {}
local TestSessionsBecomeReadyIfStarted_mt = {__index = TestSessionsBecomeReadyIfStarted}

TestSessionsBecomeReadyIfStarted.mFinished = false

local writeText = nil

function TestSessionsBecomeReadyIfStarted.new()
  local instance = TestBase.new()
  
  instance.ctx = nil

  return setmetatable(instance, TestSessionsBecomeReadyIfStarted_mt)
end

setmetatable(TestSessionsBecomeReadyIfStarted, {__index = TestBase})

function TestSessionsBecomeReadyIfStarted:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestSessionsBecomeReadyIfStarted => ")
  
  print("##############################################")
  print("### TestSessionsBecomeReadyIfStarted       ###")
  print("##############################################")
  
  GameSparksRT.setRootLogLevel(GameSparksRT.logLevel.DEBUG)
  
  self.ctx = self:getTestContext(4, true, function()
    self.ctx:stop()
      
    writeText("PASSED!\n")
      
    TestSessionsBecomeReadyIfStarted.mFinished = true
  end,
  {"0xmmx04nDwgizJ/IuvIIw+YnYc61sgm/4annpfagTqlSeQgbYp4JBZvJSBgJqnsl8uF3bjkd1ZB2k5BTeIVL0mjOYJO48k/baoHpw5RQe0VSAwcGke0wg7hI4/WVJwK0j3+ybTCbWwiKGIKE5cv1diVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV592ayXzFELmwpv64GnKAiieYnYc61sgm/4annpfagTqnSI1B8Juhfdsktpy+wAxW1Ll4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "vDRrTSwXiyhqZAEL3vLgneYnYc61sgm/4annpfagTqlSeQgbYp4JBZvJSBgJqnsl8uF3bjkd1ZB2k5BTeIVL0haPcogMELGDua8SrUqpdn9SAwcGke0wg7hI4/WVJwK0j3+ybTCbWwiKGIKE5cv1diVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV592ayXzFELmwpv64GnKAiieYnYc61sgm/4annpfagTqnSI1B8Juhfdsktpy+wAxW1Ll4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "5J0WpALoTx6CwHP2DCNCGuYnYc61sgm/4annpfagTqlSeQgbYp4JBZvJSBgJqnsl8uF3bjkd1ZB2k5BTeIVL0ianzlW3uAqck8Ivc74NMLFSAwcGke0wg7hI4/WVJwK0j3+ybTCbWwiKGIKE5cv1diVphxXy8favOb+bz+7hgCU2CAf0rR1MwIVhUvsjF36xhVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV592ayXzFELmwpv64GnKAiieYnYc61sgm/4annpfagTqnSI1B8Juhfdsktpy+wAxW1Ll4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "nuieUsQeG7rzzANS+dTDteYnYc61sgm/4annpfagTqlSeQgbYp4JBZvJSBgJqnsl8uF3bjkd1ZB2k5BTeIVL0swAPE8vj0jlQQ5bYbRejJ5SAwcGke0wg7hI4/WVJwK0j3+ybTCbWwiKGIKE5cv1diVphxXy8favOb+bz+7hgCVpmW6rm0PCAros1mmWevkUhVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV592ayXzFELmwpv64GnKAiieYnYc61sgm/4annpfagTqnSI1B8Juhfdsktpy+wAxW1Ll4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
end

return TestSessionsBecomeReadyIfStarted