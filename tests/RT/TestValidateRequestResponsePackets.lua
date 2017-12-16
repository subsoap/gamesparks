local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestValidateRequestResponsePackets = {}
local TestValidateRequestResponsePackets_mt = {__index = TestValidateRequestResponsePackets}

TestValidateRequestResponsePackets.mFinished = false

local writeText = nil

function TestValidateRequestResponsePackets.new()
  local instance = TestBase.new()
  
  instance.ctx = nil

  return setmetatable(instance, TestValidateRequestResponsePackets_mt)
end

setmetatable(TestValidateRequestResponsePackets, {__index = TestBase})

function TestValidateRequestResponsePackets:getScript()
  return "07_ping_pong"
end

function TestValidateRequestResponsePackets:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestValidateRequestResponsePackets => ")
  
  print("##############################################")
  print("### TestValidateRequestResponsePackets     ###")
  print("##############################################")
  
  self.ctx = self:getTestContext(2, false, nil,
  {"zsQ3gqae2+NBSzQXDzqylvJAPWAYH9wA0Z6Q00cVl7Y7lLETPXMUyA6VtsrsfFJVa+mdsxd/se12yUDZR06Bt2jOYJO48k/baoHpw5RQe0WbTfWyxDp1H0Ko1oPpUZMAqBSI/b+jd+xLKNe4wGKM/JyqPD3m2T6gTSZhVQEpV71555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzdbAODHLkpuH+R6c7OefNtt7vsMEZ1Y0+xWS3MGIVVexuDIZVCmvPma/ZbD6Ez0Ao/OUL0hnLJcQ7Q5BvZzfaxJA==",
  "lQtjsYDOUlzFD2uDWhi1HvJAPWAYH9wA0Z6Q00cVl7Y7lLETPXMUyA6VtsrsfFJVa+mdsxd/se12yUDZR06BtxaPcogMELGDua8SrUqpdn+bTfWyxDp1H0Ko1oPpUZMAqBSI/b+jd+xLKNe4wGKM/JyqPD3m2T6gTSZhVQEpV71555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzdbAODHLkpuH+R6c7OefNtt7vsMEZ1Y0+xWS3MGIVVexuDIZVCmvPma/ZbD6Ez0Ao/p4l0NNsk//TFyTQpUTih+w=="})
  
  local cdl = CountdownLatch.new(250)
  
  local lastPacket1 = 1
  local lastPacket2 = 0
  
  self.ctx.sessions[1].onPacketCB = function(packet)
    if packet.opCode == 100 then
      local counter = packet.data:getLong(1)
      
      print(counter .. "  " .. lastPacket1)
      if counter == lastPacket1 + 1 then
        cdl:signal()
        lastPacket1 = counter + 1
        if not cdl:isComplete() then
            self.ctx.sessions[1].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, lastPacket1))
        end
      end       
    end
  end
  
  self.ctx.sessions[2].onPacketCB = function(packet)
    if packet.opCode == 100 then
      local counter = packet.data:getLong(1)
       
      print(counter .. "  " .. lastPacket2)
      if counter == lastPacket2 + 1 then
        cdl:signal()
        lastPacket2 = counter + 1
        if not cdl:isComplete() then
            self.ctx.sessions[2].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, lastPacket2))
        end
      end   
    end
  end
      
  self.ctx.sessions[1]:start()
  self.ctx.sessions[2]:start()
  
  self.ctx.sessions[1].onReadyCB = function(packet)
    self.ctx.sessions[1].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, 1))
    self.ctx.sessions[1].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, 1))
    self.ctx.sessions[1].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, 1))
    self.ctx.sessions[1].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, 1))
    self.ctx.sessions[1].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, 1))
    self.ctx.sessions[1].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, 1))
  end

  self.ctx.sessions[2].onReadyCB = function(packet)
    self.ctx.sessions[2].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, 1))
    self.ctx.sessions[2].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, 1))
    self.ctx.sessions[2].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, 1))
    self.ctx.sessions[2].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, 1))
    self.ctx.sessions[2].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, 1))
    self.ctx.sessions[2].session:sendRTData(100, GameSparksRT.deliveryIntent.UNRELIABLE, RTData.get():setLong(1, 1))
  end
  
  cdl:wait(30, function(timedout)
    self.ctx:stop()
  
    assert(not timedout, "Didn't count down.")
    
    writeText("PASSED!\n")
    
    TestValidateRequestResponsePackets.mFinished = true
  end)
end

return TestValidateRequestResponsePackets