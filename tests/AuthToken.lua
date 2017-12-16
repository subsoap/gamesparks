local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

AuthToken = {}
AuthToken.mFinished = false

local writeText = nil
local currInstance = nil
local oldAuthToken = ""

local function part6()
  writeText("PASSED!\n")
  
  AuthToken.mFinished = true
end

local function part5(timedout)
  assert(not timedout, "GSInstance was never available.")
    
  assert(currInstance.getAuthToken())
  assert(currInstance.getAuthToken() ~= "0")
  
  assert(oldAuthToken ~= currInstance.getAuthToken())
    
  GSHelperMethods.waitForShutdown(currInstance, part6)
end

local function part4()
  currInstance = GSHelperMethods.createInstanceAndConnect("AuthToken")
  
  currInstance.setAuthToken(oldAuthToken)
  
  local ev = AutoResetEvent.new(false)
  
  currInstance.setAvailabilityCallback(function(isAvailable)
    if isAvailable then
      AutoResetEvent.set(ev)
    end
  end)
  
  AutoResetEvent.waitOne(ev, GSHelperMethods.REQUEST_TIMEOUT, part5)
end

local function part3()
  oldAuthToken = currInstance.getAuthToken()
    
  assert(oldAuthToken)
  assert(oldAuthToken ~= "0")
    
  GSHelperMethods.waitForShutdownInstance("AuthToken", part4)
end

local function part2()
  GSHelperMethods.waitForDeviceAuthentication(currInstance, part3)
end

function AuthToken:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("AuthToken => ")
  
  print("##############################################")
  print("### AuthToken                              ###")
  print("##############################################")
  
  currInstance = GSHelperMethods.createInstanceWaitForAvailable("AuthToken", part2)
end

return AuthToken