TestConfig = require("tests.RT.TestConfig")
TestContext = require("tests.RT.TestContext")
CountdownLatch = require("tests.RT.CountdownLatch")

local TestBase = {}
local TestBase_mt = {__index = TestBase}

TestBase.mFinished = false

function TestBase.new()
  local instance = {}
  
  instance.autoStartCB = nil
  
  return setmetatable(instance, TestBase_mt)
end

function TestBase:getScript()
  return nil
end

function TestBase:getVersion()
  return TestConfig.version
end

function TestBase:getRTData(depth)
  local data
  
  if depth == nil then
    depth = 1
  elseif depth == 3 then
    return nil
  end

  data = RTData.get()
  data:setDouble(1, 20.20)
  data:setFloat(2, 30.30)
  data:setLong(3, depth * 10)
  data:setLong(4, 40)
  data:setRTVector(5, RTVector.new(1.1, 2.2, 3.3))
  data:setString(6, "thisisastring" .. tostring(depth))
  data:setData(7, self:getRTData(depth + 1))
  
  return data
end

function TestBase:getContext(qty, tokens)
  if self:getVersion() > 0 then
    return TestContext.new(qty, TestConfig.apiKey, TestConfig.secret, TestConfig.rtServer, TestConfig.port, TestConfig.cluster, self:getScript(), self:getVersion(), tokens)
  else
    return TestContext.new(qty, TestConfig.apiKey, TestConfig.secret, TestConfig.rtServer, TestConfig.port, TestConfig.cluster, self:getScript(), 0, tokens)
  end
end

function TestBase:getTestContext(qty, autoStart, autoStartCB, tokens)
  local ctx = self:getContext(qty, tokens)
  
  ctx:start()
  
  local cdl = CountdownLatch.new(#ctx.sessions)
  
  for i = 1, #ctx.sessions do
    ctx.sessions[i].onPacketCB = function(packet)
      print(packet)
      
      error("Unexpected Packet on wrong session " .. ctx.sessions[i].session.peerId)
    end
  end

  for i = 1, #ctx.sessions do
    ctx.sessions[i].onReadyCB = function(ready)
      if ready then
        cdl:signal()
      end
    end
  end
  
  if autoStart then
    for i = 1, #ctx.sessions do
      ctx.sessions[i]:start()
    end
    
    self.autoStartCB = autoStartCB
    
    cdl:wait(5, function(timedout)
      if timedout then
        error("Did not become ready")
      end
      
      if self.autoStartCB ~= nil then
        self.autoStartCB()
      end
    end)
  end
  
  return ctx
end

return TestBase