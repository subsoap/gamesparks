TestUtils = require("tests.RT.TestUtils")
require("gamesparks.runtime")

local TestContext = {}
local TestContext_mt = {__index = TestContext}

function TestContext.new(qty, apiKey, secret, rtServer, port, cluster, script, version, tokens)
  local instance = {}
  
  instance.running = false
  instance.sessionId = TestUtils.generateGUID()
  instance.sessions = TestUtils.getSessions(qty, apiKey, secret, rtServer, port, cluster, script, version, tokens)
  
  return setmetatable(instance, TestContext_mt)
end

function TestContext:start()
  self.running = true
  
  runtime.addEventListener("enterFrame", self)
end

function TestContext:stop()
  self.running = false
  
  runtime.removeEventListener("enterFrame", self)
  
  for i = 1, #self.sessions do
    self.sessions[i].session:stop()
  end
end

function TestContext:enterFrame(event)
  for i = 1, #self.sessions do
    self.sessions[i].session:update()
  end
end

return TestContext