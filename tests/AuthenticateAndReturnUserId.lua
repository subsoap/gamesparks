local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

AuthenticateAndReturnUserId = {}
AuthenticateAndReturnUserId.mFinished = false

local writeText = nil
local currInstance = nil
local response = nil

local function part3()
  writeText("PASSED!\n")
  
  AuthenticateAndReturnUserId.mFinished = true
end

local function part2(timedout)
  assert(not timedout, "Timeout on authentication.")
    
  assert(response)
  assert(response:getUserId())
  assert(response:getUserId() ~= "")
  
  GSHelperMethods.waitForShutdownInstance("AuthenticateAndReturnUserId", part3)
end

function AuthenticateAndReturnUserId:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("AuthenticateAndReturnUserId => ")
  
  print("##############################################")
  print("### AuthenticateAndReturnUserId            ###")
  print("##############################################")
  
  currInstance = GSHelperMethods.createInstanceAndConnect("AuthenticateAndReturnUserId")
  
  local authEvent = AutoResetEvent.new(false)
    
  local request = currInstance.getRequestBuilder().createDeviceAuthenticationRequest()
      
  request:setDeviceId("12345")
  request:setDeviceOS("MacOS")
  request:send(function(resp)
    response = resp
    
    AutoResetEvent.set(authEvent)
  end)
    
  AutoResetEvent.waitOne(authEvent, GSHelperMethods.REQUEST_TIMEOUT, part2)
end

return AuthenticateAndReturnUserId