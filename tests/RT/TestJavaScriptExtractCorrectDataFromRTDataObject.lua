local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestJavaScriptExtractCorrectDataFromRTDataObject = {}
local TestJavaScriptExtractCorrectDataFromRTDataObject_mt = {__index = TestJavaScriptExtractCorrectDataFromRTDataObject}

function TestJavaScriptExtractCorrectDataFromRTDataObject:getScript()
  return "08_test_unit"
end

function TestJavaScriptExtractCorrectDataFromRTDataObject.new()
  local instance = TestBase.new()
  
  instance.ctx = nil
  
  return setmetatable(instance, TestJavaScriptExtractCorrectDataFromRTDataObject_mt)
end

setmetatable(TestJavaScriptExtractCorrectDataFromRTDataObject, {__index = TestBase})

function TestJavaScriptExtractCorrectDataFromRTDataObject:launch(intent, callback, tokens)
  self.ctx = self:getTestContext(2, true, function()
    local cdl = CountdownLatch.new(6)
    
    self.ctx.sessions[1].onPacketCB = function(packet)
      if packet.opCode == 555 then
        if TestUtils.round(packet.data:getFloat(1), 1) ~= 30.3 then
          error("packet.GetFloat (1) " .. packet.data:getFloat(1))
        end
        cdl:signal()
      elseif packet.opCode == 556 then
        if packet.data:getLong(1) ~= 10 then
          error("packet.GetLong (1) " .. packet.data:getLong(1))
        end
        cdl:signal()
      elseif packet.opCode == 557 then
        if packet.data:getLong(1) ~= 40 then
          error("packet.GetLong (1) " .. packet.data:getLong(1))
        end
        cdl:signal()
      elseif packet.opCode == 558 then
        if TestUtils.round(packet.data:getRTVector(1).x, 1) ~= 1.1 and
          TestUtils.round(packet.data:getRTVector(1).y, 1) ~= 2.2 and
          TestUtils.round(packet.data:getRTVector(1).z, 1) ~= 3.3 then
          error("packet.GetRTVector (1) " .. packet.data:getRTVector(1))
        end
        cdl:signal()
      elseif packet.opCode == 559 then
        if TestUtils.round(packet.data:getDouble(1), 2) ~= 20.20 then
          error("packet.GetDouble (1) " .. packet.data:getDouble(1))
        end
        cdl:signal()
      elseif packet.opCode == 560 then
        if packet.data:getData(1):getLong(3) ~= 20 then
          error("packet.GetData (1) " .. packet.data:getData(1):getLong(3))
        end
        cdl:signal()
      else
        error("Unexpected OpCode " .. packet.opCode)
      end
    end

    self.ctx.sessions[1].session:sendRTData(
      554,  
      intent, 
      self:getRTData(), 
      {self.ctx.sessions[2].session.peerId})
    
    cdl:wait(10, function(timedout)
      self.ctx:stop()
    
      assert(not timedout, "Did not get message.")
      
      callback()
    end)
  end, tokens)
end

return TestJavaScriptExtractCorrectDataFromRTDataObject