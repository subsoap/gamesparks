local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

WebSocketDisconnectReopen2 = {}
WebSocketDisconnectReopen2.mFinished = false

local writeText = nil
local currInstance = nil

local function part5()
  writeText("PASSED!\n")
  
  WebSocketDisconnectReopen2.mFinished = true
end

local function part4(timedout)
  assert(not timedout, "LogEventResponse not received.")
  
  GSHelperMethods.waitForShutdown(currInstance, part5)
end

local function part3()
  local resetOnResponse = AutoResetEvent.new(false)
    
  currInstance.disconnect(false)
  
  local request = currInstance.getRequestBuilder().createLogEventRequest()
  
  request:setEventKey("testMessage")
  request:setEventAttribute("foo", "bar")
  request:send(function(resp)
    if not resp:hasErrors() then
      AutoResetEvent.set(resetOnResponse)
    end
  end)
  
  AutoResetEvent.waitOne(resetOnResponse, GSHelperMethods.REQUEST_TIMEOUT, part4)
end

local function part2()
  GSHelperMethods.waitForDeviceAuthentication(currInstance, part3)
end

function WebSocketDisconnectReopen2:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("WebSocketDisconnectReopen2 => ")
  
  print("##############################################")
  print("### WebSocketDisconnectReopen2             ###")
  print("##############################################")
  
  currInstance = GSHelperMethods.createInstanceWaitForAvailable("WebSocketDisconnectReopen2", part2)
end

return WebSocketDisconnectReopen2