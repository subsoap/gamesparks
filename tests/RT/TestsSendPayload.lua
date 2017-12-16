local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

TestsSendPayload = {}
TestsSendPayload.ctx = nil

function TestsSendPayload.launch(intent, callback, tokens)
  TestsSendPayload.ctx = TestBase.new():getTestContext(2, true, function()
    local cdl = CountdownLatch.new(2)
    
    TestsSendPayload.ctx.sessions[2].onPacketCB = function(packet)
      if packet.opCode == 222 then
        local b = {}

        packet.stream:read(b, 0, packet.streamLength)
        
        if string.char(unpack(b)) == TestsSendPayload.ctx.sessionId then
          cdl:signal()
        end
      else
        error("Unexpected Packet")
      end
    end

    TestsSendPayload.ctx.sessions[1].session:sendData(
      222,  
      intent, 
      {string.byte(TestsSendPayload.ctx.sessionId, 1, #TestsSendPayload.ctx.sessionId)},
      nil,
      {TestsSendPayload.ctx.sessions[2].session.peerId})

    TestsSendPayload.ctx.sessions[1].session:sendBytes(
      222,  
      intent, 
      {string.byte(TestsSendPayload.ctx.sessionId, 1, #TestsSendPayload.ctx.sessionId)},
      {TestsSendPayload.ctx.sessions[2].session.peerId})
    
    cdl:wait(5, function(timedout)
      TestsSendPayload.ctx:stop()
    
      assert(not timedout, "Did not get message.")
      
      callback()
    end)
  end, tokens)
end

return TestsSendPayload