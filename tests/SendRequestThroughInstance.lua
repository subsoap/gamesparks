local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

SendRequestThroughInstance = {}
SendRequestThroughInstance.mFinished = false

local writeText = nil
local currInstance = nil
local response = nil

local function part4()
  writeText("PASSED!\n")
  
  SendRequestThroughInstance.mFinished = true
end

local function part3(timedout)
  assert(not timedout, "Response time out.")
    
  assert(response, "No response received.")
  assert(not response:hasErrors(), "Response had errors.")
  
  GSHelperMethods.waitForShutdownInstance("SendRequestThroughInstance", part4)
end

local function part2(timedout)
  assert(not timedout, "Authentication failed.")
  
  local resetEvent = AutoResetEvent.new(false)
  
  local request = currInstance.getRequestBuilder().createLogEventRequest()
    
  request:setEventKey("testMessage")
  request:setEventAttribute("foo", "bar")
  request:send(function(resp)
    response = resp
    
    AutoResetEvent.set(resetEvent)
  end)
  
  AutoResetEvent.waitOne(resetEvent, GSHelperMethods.REQUEST_TIMEOUT, part3)
end

function SendRequestThroughInstance:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("SendRequestThroughInstance => ")
  
  print("##############################################")
  print("### SendRequestThroughInstance             ###")
  print("##############################################")
  
  currInstance = GSHelperMethods.createInstanceAndConnect("SendRequestThroughInstance")
    
  local devAuthResetEvent = AutoResetEvent.new(false)
  
  local request = currInstance.getRequestBuilder().createDeviceAuthenticationRequest()
    
  request:setDeviceId("12345")
  request:setDeviceOS("MacOS")
  request:send(function(resp)
    if not resp:hasErrors() then
      AutoResetEvent.set(devAuthResetEvent)
    end
  end)
  
  AutoResetEvent.waitOne(devAuthResetEvent, GSHelperMethods.REQUEST_TIMEOUT, part2)
end

return SendRequestThroughInstance