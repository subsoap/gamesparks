local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

GSInstanceTest = {}
GSInstanceTest.mFinished = false

local writeText = nil
local currInstance = nil
local deviceAuthResponse = nil

local function part3()
  writeText("PASSED!\n")
  
  GSInstanceTest.mFinished = true
end

local function part2(timedout)
  assert(not timedout, "Time out.")
    
  assert(deviceAuthResponse)
  
  GSHelperMethods.waitForShutdownInstance("GSInstanceTest", part3)
end

function GSInstanceTest:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("GSInstanceTest => ")
  
  print("##############################################")
  print("### GSInstanceTest                         ###")
  print("##############################################")
  
  currInstance = GSHelperMethods.createInstanceAndConnect("GSInstanceTest")
    
  local deviceAuthEvent = AutoResetEvent.new(false)
  
  local request = currInstance.getRequestBuilder().createDeviceAuthenticationRequest()
    
  request:setDeviceId("12345")
  request:setDeviceOS("MacOS")
  request:send(function(resp)
    deviceAuthResponse = resp
    
    AutoResetEvent.set(deviceAuthEvent)
  end)
  
  AutoResetEvent.waitOne(deviceAuthEvent, GSHelperMethods.REQUEST_TIMEOUT, part2)
end

return GSInstanceTest