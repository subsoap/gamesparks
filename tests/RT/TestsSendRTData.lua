local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

TestsSendRTData = {}
TestsSendRTData.testBase = nil
TestsSendRTData.ctx = nil

function TestsSendRTData.launch(intent, callback, tokens)
  TestsSendRTData.testBase = TestBase.new()
  TestsSendRTData.ctx = TestsSendRTData.testBase:getTestContext(2, true, function()
    local cdl = CountdownLatch.new(3)
    
    TestsSendRTData.ctx.sessions[2].onPacketCB = function(packet)
      if packet.opCode == 333 then
        --if packet.stream == nil and packet.data:toString() == TestsSendRTData.testBase:getRTData():toString() then
        if packet.stream == nil then
          cdl:signal()
        end
      else
        error("Unexpected Packet")
      end
    end

    TestsSendRTData.ctx.sessions[1].session:sendData(
      333,  
      intent, 
      nil, 
      TestsSendRTData.testBase:getRTData(), 
      {TestsSendRTData.ctx.sessions[2].session.peerId})

    TestsSendRTData.ctx.sessions[1].session:sendRTData(
      333,  
      intent, 
      TestsSendRTData.testBase:getRTData(), 
      {TestsSendRTData.ctx.sessions[2].session.peerId})
      
    TestsSendRTData.ctx.sessions[1].session:sendRTDataAndBytes(
      333,  
      intent, 
      nil, 
      TestsSendRTData.testBase:getRTData(), 
      {TestsSendRTData.ctx.sessions[2].session.peerId})
    
    cdl:wait(5, function(timedout)
      TestsSendRTData.ctx:stop()
    
      assert(not timedout, "Did not get message.")
      
      callback()
    end)
  end, tokens)
end

return TestsSendRTData