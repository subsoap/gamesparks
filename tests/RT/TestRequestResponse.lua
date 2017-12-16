local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestRequestResponse = {}
local TestRequestResponse_mt = {__index = TestRequestResponse}

TestRequestResponse.mFinished = false

local writeText = nil

function TestRequestResponse.new()
  local instance = TestBase.new()
  
  instance.ctx = nil

  return setmetatable(instance, TestRequestResponse_mt)
end

setmetatable(TestRequestResponse, {__index = TestBase})

function TestRequestResponse:getScript()
  return "05_requestResponse"
end

function TestRequestResponse:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestRequestResponse => ")
  
  print("##############################################")
  print("### TestRequestResponse                    ###")
  print("##############################################")
  
  self.ctx = self:getTestContext(1, true, function()
    self.ctx.sessions[1].session:sendRTData(422, GameSparksRT.deliveryIntent.UNRELIABLE, nil)
    self.ctx.sessions[1].session:sendRTData(422, GameSparksRT.deliveryIntent.UNRELIABLE, nil)
    
    timer.seconds(2.0, function(event)
      self.ctx:stop()
      
      writeText("PASSED!\n")
      
      TestRequestResponse.mFinished = true
    end)
  end,
  {"CMu66s6xV+VnvYE3i4d4sIcoPVB45RUJZ5WYBUhXpDmg/w5dKBvVDUTrPHSY42i0XALipqKaWIhdq7tv9zD1cWjOYJO48k/baoHpw5RQe0VgUOrurvubUZMC2t/0KcNbMaQy5XeqKht7j6Qh7KSQ0Bu0FAY9DROK04hbpUdfZ4ZHf6bXa2fNYxySritUb3sVtDW25TRxQf1DeP3vZvOsH0u1GpFChzR9GBhGxPyswMOfGcGO0cjTeZPhL7XgcOtHFvIvo1A3n6KfBtD2HZ9obfP0k1FAqM3K7Mn8Vz0FUPj/vu8isDtsl2xYMmJvdnT6MIADgfKPnkcftuwxq0eoH8C9taFaa+fJVtXVnE1Gj7nltA62Siwxdx28arY3/WlcI4XrriSKUcQ4tcC5yowicDZOaoa5TdwyUw3DrF4wAMs="})
end

return TestRequestResponse