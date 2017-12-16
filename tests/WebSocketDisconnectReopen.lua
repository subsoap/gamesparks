local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

WebSocketDisconnectReopen = {}
WebSocketDisconnectReopen.mFinished = false

local writeText = nil
local currInstance = nil

local function part4()
  writeText("PASSED!\n")
  
  WebSocketDisconnectReopen.mFinished = true
end

local function part3(timedout)
  assert(not timedout, "GSInstance was not unavailable.")
    
  GSHelperMethods.waitForShutdown(currInstance, part4)
end

local function part2(timedout)
  assert(not timedout, "GSInstance was never available.")
  
  local resetOnResponse = AutoResetEvent.new(false)
  
  currInstance.disconnect(false)
  
  local request = currInstance.getRequestBuilder().createDeviceAuthenticationRequest()
  
  request:setDeviceId("12345")
  request:setDeviceOS("MacOS")
  request:send(function(resp)
    if not resp:hasErrors() then
      AutoResetEvent.set(resetOnResponse)
    end
  end)
  
  AutoResetEvent.waitOne(resetOnResponse, GSHelperMethods.REQUEST_TIMEOUT, part3)
end

function WebSocketDisconnectReopen:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("WebSocketDisconnectReopen => ")
  
  print("##############################################")
  print("### WebSocketDisconnectReopen              ###")
  print("##############################################")
  
  currInstance = GSHelperMethods.createInstanceAndConnect("WebSocketDisconnectReopen")
  
  local resetOnAvailable = AutoResetEvent.new(false)
    
  currInstance.setAvailabilityCallback(function(isAvailable)
    if isAvailable then
      AutoResetEvent.set(resetOnAvailable)
    end
  end)
  
  AutoResetEvent.waitOne(resetOnAvailable, GSHelperMethods.REQUEST_TIMEOUT, part2)
end

return WebSocketDisconnectReopen