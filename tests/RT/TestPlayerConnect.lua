local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestPlayerConnect = {}
local TestPlayerConnect_mt = {__index = TestPlayerConnect}

TestPlayerConnect.mFinished = false

local writeText = nil

function TestPlayerConnect.new()
  local instance = TestBase.new()
  
  instance.ctx = nil

  return setmetatable(instance, TestPlayerConnect_mt)
end

setmetatable(TestPlayerConnect, {__index = TestBase})

function TestPlayerConnect:getScript()
  return "01_playerConnect"
end

function TestPlayerConnect:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestPlayerConnect => ")
  
  print("##############################################")
  print("### TestPlayerConnect                      ###")
  print("##############################################")
  
  self.ctx = self:getTestContext(2, false, nil, 
  {"lqZUdXCCOA63mYDGt4hrfuRn3f04j5sHDfPNgB1VTKsDKcOnVyjIZiIEqukHraQnNqRPWDWAVufCaN8rKpEKMmjOYJO48k/baoHpw5RQe0USEOC6RC+6Xl2hk4hIJWKC0lNDN3CWTIMSd5ZgI1vHj4BGoV0YhVHExdguPx334VPhgeQ2rabaCYDEL21x/QVJ7SFR4OM4qypWC/gohm9xy5d3yVM6CVSsgO1XBobA2loR9/JXsJr4qRnfEGrLowtrCPZ9f5t2qoGWcKgybYGbt5q8YGNBoVT+J6Q9gBNz/MJgz02IGw/zPH6vl8oVFpPld8yKN1y2NTHKH41J3WQJ0+0iHm961F655tf84hLLYJ6H9PM/YnCx1XYv6piEBTo4oGr2c4HRKYmRv3ASne4b2HIJyAEDX94msYvEDkowt5U=",
  "S5KMIJtJlReBc/BtZFeRFuRn3f04j5sHDfPNgB1VTKsDKcOnVyjIZiIEqukHraQnNqRPWDWAVufCaN8rKpEKMhaPcogMELGDua8SrUqpdn8SEOC6RC+6Xl2hk4hIJWKC0lNDN3CWTIMSd5ZgI1vHj4BGoV0YhVHExdguPx334VPhgeQ2rabaCYDEL21x/QVJ7SFR4OM4qypWC/gohm9xy5d3yVM6CVSsgO1XBobA2loR9/JXsJr4qRnfEGrLowtrCPZ9f5t2qoGWcKgybYGbt5q8YGNBoVT+J6Q9gBNz/MJgz02IGw/zPH6vl8oVFpPld8yKN1y2NTHKH41J3WQJ0+0iHm961F655tf84hLLYJ6H9PM/YnCx1XYv6piEBTo4oGr2c4HRKYmRv3ASne4b2BVHt57s3QAH6j3cLqmGUuY="})
  
  local cdl = CountdownLatch.new(3)
  
  local session0Responses = {"Player gsplayerid1 connected.", "Player gsplayerid2 connected."}
  local session1Responses = {"Player gsplayerid1 connected.", "Player gsplayerid2 connected."}
  
  self.ctx.sessions[1].onPacketCB = function(packet)
    if packet.opCode == 123 then
      if not TestUtils.contains(session0Responses, packet.data:getString(1)) then
        error("NOT EXPECTED " .. packet.data:getString(1))
      end
      TestUtils.remove(session0Responses, packet.data:getString(1))
      cdl:signal()   
    end
  end

  self.ctx.sessions[2].onPacketCB = function(packet)
    if packet.opCode == 123 then
      if not TestUtils.contains(session1Responses, packet.data:getString(1)) then
        error("NOT EXPECTED " .. packet.data:getString(1))
      end
      TestUtils.remove(session1Responses, packet.data:getString(1))
      cdl:signal()
    end
  end
  
  self.ctx.sessions[1]:start()
  self.ctx.sessions[2]:start()
  
  cdl:wait(10, function(timedout)
    self.ctx:stop()
  
    assert(not timedout, "Messages not recieved.")
    
    writeText("PASSED!\n")
    
    TestPlayerConnect.mFinished = true
  end)
end

return TestPlayerConnect