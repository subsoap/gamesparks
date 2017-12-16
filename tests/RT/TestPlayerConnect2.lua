local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestPlayerConnect2 = {}
local TestPlayerConnect2_mt = {__index = TestPlayerConnect2}

TestPlayerConnect2.mFinished = false

local writeText = nil

function TestPlayerConnect2.new()
  local instance = TestBase.new()
  
  instance.ctx = nil

  return setmetatable(instance, TestPlayerConnect2_mt)
end

setmetatable(TestPlayerConnect2, {__index = TestBase})

function TestPlayerConnect2:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestPlayerConnect2 => ")
  
  print("##############################################")
  print("### TestPlayerConnect2                     ###")
  print("##############################################")
  
  self.ctx = self:getTestContext(4, false, nil,
  {"z5GKRnpTE+3FrRxx72/WW7fN4kscDg//BsWyD1nE95I5rRpng1epcKv1Vkn+V2M4xT7ufCqnprfFHpA06D5mRmjOYJO48k/baoHpw5RQe0XQpIbFlT8ha7X9wephhSSPBNgNooZEadrFm9rihohK+SVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5Y3JTXdOyRB+92rXSvwpNF7fN4kscDg//BsWyD1nE95I8mKnElLwX0dP6F2Mc+QzNLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "jGSiwAW8q5P3UW6M0jhFYrfN4kscDg//BsWyD1nE95I5rRpng1epcKv1Vkn+V2M4xT7ufCqnprfFHpA06D5mRhaPcogMELGDua8SrUqpdn/QpIbFlT8ha7X9wephhSSPBNgNooZEadrFm9rihohK+SVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5Y3JTXdOyRB+92rXSvwpNF7fN4kscDg//BsWyD1nE95I8mKnElLwX0dP6F2Mc+QzNLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "Q6Xc7VV3NzjfoHtLKmbUibfN4kscDg//BsWyD1nE95I5rRpng1epcKv1Vkn+V2M4xT7ufCqnprfFHpA06D5mRianzlW3uAqck8Ivc74NMLHQpIbFlT8ha7X9wephhSSPBNgNooZEadrFm9rihohK+SVphxXy8favOb+bz+7hgCU2CAf0rR1MwIVhUvsjF36xhVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5Y3JTXdOyRB+92rXSvwpNF7fN4kscDg//BsWyD1nE95I8mKnElLwX0dP6F2Mc+QzNLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "Y3OKafpfcfSpVVAiovWEP7fN4kscDg//BsWyD1nE95I5rRpng1epcKv1Vkn+V2M4xT7ufCqnprfFHpA06D5mRswAPE8vj0jlQQ5bYbRejJ7QpIbFlT8ha7X9wephhSSPBNgNooZEadrFm9rihohK+SVphxXy8favOb+bz+7hgCVpmW6rm0PCAros1mmWevkUhVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5Y3JTXdOyRB+92rXSvwpNF7fN4kscDg//BsWyD1nE95I8mKnElLwX0dP6F2Mc+QzNLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
  
  local cdl = CountdownLatch.new(3)
  
  self.ctx.sessions[1]:start()

  self.ctx.sessions[1].onPlayerConnectCB = function(peerId)
    print("ctx.sessions[1].onPlayerConnectCB " .. peerId)

    if peerId == 2 then
      cdl:signal()
      self.ctx.sessions[2]:stop()
    end
  end

  self.ctx.sessions[1].onPlayerDisconnectCB = function(peerId)
    if peerId == 2 then
      cdl:signal()
      self.ctx.sessions[2]:start()
    end
  end

  self.ctx.sessions[1].onReadyCB = function(ready)
    if table.getn(self.ctx.sessions[1].session.activePeers) == 1 and self.ctx.sessions[1].session.activePeers[1] == 1 then
      self.ctx.sessions[2]:start()
    end
  end
  
  cdl:wait(5, function(timedout)
    self.ctx:stop()
  
    assert(not timedout, "Peer 2 did not connect.")
    
    writeText("PASSED!\n")
    
    TestPlayerConnect2.mFinished = true
  end)
end

return TestPlayerConnect2