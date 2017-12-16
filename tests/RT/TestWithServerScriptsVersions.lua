local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestWithServerScriptsVersions = {}
local TestWithServerScriptsVersions_mt = {__index = TestWithServerScriptsVersions}

function TestWithServerScriptsVersions:getScript()
  return "08_test_unit"
end

function TestWithServerScriptsVersions.new()
  local instance = TestBase.new()
  
  instance.ctx = nil
  
  return setmetatable(instance, TestWithServerScriptsVersions_mt)
end

setmetatable(TestWithServerScriptsVersions, {__index = TestBase})

function TestWithServerScriptsVersions:launch(intent, callback, tokens)
  self.ctx = self:getTestContext(2, true, function()
    local cdl = CountdownLatch.new(1)
    
    self.ctx.sessions[1].onPacketCB = function(packet)
      if packet.opCode == 445 then
        local vec = packet.data:getRTVector(2)

        if vec.x ~= 1.0 then
          error("vec.x " .. vec.x)
        end

        if vec.y ~= 2.0 then
          error("vec.y " .. vec.y)
        end

        if packet.data:getLong(1) ~= 2 then
          error("GetLong(1) " .. packet.data:getLong(1))
        end

        cdl:signal()

      else
        error("Unexpected Packet")
      end
    end

    self.ctx.sessions[1].session:sendData(
      444,  
      intent, 
      nil, 
      nil, 
      {self.ctx.sessions[2].session.peerId})
    
    cdl:wait(5, function(timedout)
      self.ctx:stop()
    
      assert(not timedout, "Did not get message.")
      
      callback()
    end)
  end, tokens)
end

return TestWithServerScriptsVersions