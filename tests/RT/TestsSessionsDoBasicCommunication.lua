local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

TestsSessionsDoBasicCommunication = {}
TestsSessionsDoBasicCommunication.ctx = nil

function TestsSessionsDoBasicCommunication.launch(intent, callback, tokens)
  TestsSessionsDoBasicCommunication.ctx = TestBase.new():getTestContext(4, true, function()
    local cdl = CountdownLatch.new(2)
    
    TestsSessionsDoBasicCommunication.ctx.sessions[2].onPacketCB = function(packet)
      if packet.opCode == 123 and packet.sender == TestsSessionsDoBasicCommunication.ctx.sessions[1].session.peerId then
        cdl:signal()
      elseif packet.opCode == 234 and packet.sender == TestsSessionsDoBasicCommunication.ctx.sessions[1].session.peerId then
        cdl:signal()
      else
        error("Unexpected Packet opCode:" .. packet.opCode .. " sender:" .. packet.sender)
      end
    end

    TestsSessionsDoBasicCommunication.ctx.sessions[1].session:sendData(123, intent, nil, nil, {TestsSessionsDoBasicCommunication.ctx.sessions[2].session.peerId})
    TestsSessionsDoBasicCommunication.ctx.sessions[1].session:sendData(234, intent, nil, nil, {TestsSessionsDoBasicCommunication.ctx.sessions[2].session.peerId})
    
    cdl:wait(5, function(timedout)
      TestsSessionsDoBasicCommunication.ctx:stop()
    
      assert(not timedout, "Did not get message.")
      
      callback()
    end)
  end, tokens)
 end

return TestsSessionsDoBasicCommunication