local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

WebSocketErrorTimeout = {}
WebSocketErrorTimeout.mFinished = false

local writeText = nil
local currInstance = nil

local function part4()
  writeText("PASSED!\n")
  
  WebSocketErrorTimeout.mFinished = true
end

local function part3(timedout)
  assert(not timedout, "Call never timed out.")
    
  currInstance.setNetworkAvailable(true)
  
  GSHelperMethods.waitForShutdown(currInstance, part4)
end

local function part2(timedout)
  local resetOnError = AutoResetEvent.new(false)
  local resetOnReceive = AutoResetEvent.new(false)
  
  assert(not timedout, "Device authentication was not completed.")
  
  currInstance.setNetworkAvailable(false)
  currInstance.disconnect(false)
  
  local request = currInstance.getRequestBuilder().createLogEventRequest()

  request:setEventKey("testMessage")
  request:setEventAttribute("foo", "bar")
  request:send(function(resp)
    if resp:hasErrors() then
      AutoResetEvent.set(resetOnError) 
    else
      AutoResetEvent.set(resetOnReceive)
    end
  end)
  
  AutoResetEvent.waitOne(resetOnError, GSHelperMethods.REQUEST_TIMEOUT, part3)
end

function WebSocketErrorTimeout:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("WebSocketErrorTimeout => ")
  
  print("##############################################")
  print("### WebSocketErrorTimeout                  ###")
  print("##############################################")
  
  currInstance = GSHelperMethods.createInstanceAndConnect("WebSocketErrorTimeout")
  
  local authReset = AutoResetEvent.new(false)
    
  local request = currInstance.getRequestBuilder().createDeviceAuthenticationRequest()
  
  request:setDeviceId("12345")
  request:setDeviceOS("MacOS")
  request:send(function(resp)
    AutoResetEvent.set(authReset)
  end)
    
  AutoResetEvent.waitOne(authReset, GSHelperMethods.REQUEST_TIMEOUT, part2)
end

return WebSocketErrorTimeout