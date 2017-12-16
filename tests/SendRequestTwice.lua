local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

SendRequestTwice = {}
SendRequestTwice.mFinished = false

local writeText = nil
local currInstance = nil
local response1 = nil
local response2 = nil
local counter = 3

local function part3()
  writeText("PASSED!\n")
  
  SendRequestTwice.mFinished = true
end

local function part2(timedout)
  assert(not timedout, "LogEventResponse was never called. Time out.")
    
  counter = counter - 1
  if counter <= 0 then
    GSHelperMethods.waitForShutdownInstance("SendRequestTwice", part3)
  end
end

function SendRequestTwice:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("SendRequestTwice => ")
  
  print("##############################################")
  print("### SendRequestTwice                       ###")
  print("##############################################")
  
  currInstance = GSHelperMethods.createInstanceAndConnect("SendRequestTwice")
    
  local authenticatedEvent = AutoResetEvent.new(false)
  local logRequestEvent1 = AutoResetEvent.new(false)
  local logRequestEvent2 = AutoResetEvent.new(false)
  
  local request = currInstance.getRequestBuilder().createDeviceAuthenticationRequest()
    
  request:setDeviceId("12345")
  request:setDeviceOS("MacOS")
  request:send(function(resp)
    AutoResetEvent.set(authenticatedEvent)
        
    local logRequest = currInstance.getRequestBuilder().createLogEventRequest()
    
    logRequest:send(function(resp)
      response1 = resp
        
      AutoResetEvent.set(logRequestEvent1)
    end)
    
    logRequest:send(function(resp)
      response2 = resp
      
      AutoResetEvent.set(logRequestEvent2)
    end)
    
    assert(not logRequest:getAttribute("requestId"))
  end)
  
  AutoResetEvent.waitOne(authenticatedEvent, GSHelperMethods.REQUEST_TIMEOUT, part2)
  AutoResetEvent.waitOne(logRequestEvent1, GSHelperMethods.REQUEST_TIMEOUT, part2)
  AutoResetEvent.waitOne(logRequestEvent2, GSHelperMethods.REQUEST_TIMEOUT, part2)
end

return SendRequestTwice