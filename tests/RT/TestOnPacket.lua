local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestOnPacket = {}
local TestOnPacket_mt = {__index = TestOnPacket}

TestOnPacket.mFinished = false

local writeText = nil

function TestOnPacket.new()
  local instance = TestBase.new()
  
  instance.ctx = nil
  
  return setmetatable(instance, TestOnPacket_mt)
end

setmetatable(TestOnPacket, {__index = TestBase})

function TestOnPacket:getScript()
  return "04_onPacket"
end

function TestOnPacket:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestOnPacket => ")
  
  print("##############################################")
  print("### TestOnPacket                           ###")
  print("##############################################")
  
  self.ctx = self:getTestContext(2, true, function()
    local cdl = CountdownLatch.new(5)
    
    self.ctx.sessions[1].onPacketCB = function(packet)
      if packet.opCode == 402 then
        cdl:signal()
      elseif packet.opCode == 1402 then
        cdl:signal()
      else
        error(packet:toString())
      end
    end
  
    self.ctx.sessions[2].onPacketCB = function(packet)
      if packet.opCode == 1401 then
        cdl:signal()
    
        local myVec = RTVector.new(1.0, 2.0, 3.0)
    
        self.ctx.sessions[2].session:sendRTData(402, 
          GameSparksRT.deliveryIntent.UNRELIABLE, 
          RTData.get()
            :setData(2, RTData.get():setLong(1, 1))
            :setDouble(1, 1.2345)
            :setFloat(3, 1.23)
            :setRTVector(4, myVec)
            :setLong(6, 1234)
            :setString(5, "gabs"))
      elseif packet.opCode == 1402 then
        local d = packet.data
    
        if d:getData(12):getLong(1) == 1 and
          TestUtils.round(d:getDouble(11), 4) == 1.2345 and
          TestUtils.round(d:getFloat(13), 2) == 1.23 and
          TestUtils.round(d:getRTVector(14).x, 1) == 1.0 and
          TestUtils.round(d:getRTVector(14).y, 1) == 2.0 and
          TestUtils.round(d:getRTVector(14).z, 1) == 3.0 and
          d:getLong(16) == 1234 and
          d:getString(15) == "gabs" then
          cdl:signal()
        else
          error(packet:toString())
        end
      elseif packet.opCode == 1414 then
        if string.sub(packet.data:getString(1), 1, 1) == "{" then
          cdl:signal()
        end
      else
        error(packet:toString())
      end
    end
    
    self.ctx.sessions[2].session:sendRTData(401, GameSparksRT.deliveryIntent.UNRELIABLE, nil, {1})
    self.ctx.sessions[2].session:sendRTData(413, GameSparksRT.deliveryIntent.UNRELIABLE, nil, {1})
    self.ctx.sessions[2].session:sendRTData(414, GameSparksRT.deliveryIntent.UNRELIABLE, nil, {1})
    self.ctx.sessions[2].session:sendRTData(412, 
      GameSparksRT.deliveryIntent.UNRELIABLE, 
      RTData.get():setData(1, RTData.get():setData(1, RTData.get():setDouble(1, 1234.123))),
      {1})
    
    cdl:wait(5, function(timedout)
      print("Stopped")
      
      self.ctx:stop()
    
      assert(not timedout, "Didn't count down.")
      
      writeText("PASSED!\n")
      
      TestOnPacket.mFinished = true
    end)
  end,
  {"0Kh3hY0YYYHNivLGlrd+D96O+M7E3wBN/gIic4oau/uJVwSp9AjbyeJSANqCvnXqEJDwt2YST6O5VhAfvgSSgWjOYJO48k/baoHpw5RQe0WxUiqkD/O/5I4BCQRNMHfrLIsmI9ly+QR3vGzBBT24nifyo7DuT+GiVOMGJQCePMpjJ4sRGVnx6rVZOnQVic8zHXcXa7KTAFLnj1Q9eCMyMY+Emy9Jalf1zmJK2fJQVbto3WEKNmf/h4wU1e5NsnXxV2zaroTGavjXpqxRLuiTm0jDKfl/6ilopvl4zIEDii3OBWaiffU/PltG73J1lwx+yOhRzDZXGMDdVYkN5PxTeUHiM4ExAatH6wJd7Gz+ID0sbDbIjvcnH73rMmPMVbR7FlTS5tGBMzkqdOxAaU6aDQ==",
  "8nEJp7b9MVUsTKJl5mm/et6O+M7E3wBN/gIic4oau/uJVwSp9AjbyeJSANqCvnXqEJDwt2YST6O5VhAfvgSSgRaPcogMELGDua8SrUqpdn+xUiqkD/O/5I4BCQRNMHfrLIsmI9ly+QR3vGzBBT24nifyo7DuT+GiVOMGJQCePMpjJ4sRGVnx6rVZOnQVic8zHXcXa7KTAFLnj1Q9eCMyMY+Emy9Jalf1zmJK2fJQVbto3WEKNmf/h4wU1e5NsnXxV2zaroTGavjXpqxRLuiTm0jDKfl/6ilopvl4zIEDii3OBWaiffU/PltG73J1lwx+yOhRzDZXGMDdVYkN5PxTeUHiM4ExAatH6wJd7Gz+ID0sbDbIjvcnH73rMmPMVbR7+PD3iq02gklwS5fTO/FLiw=="})
end

return TestOnPacket