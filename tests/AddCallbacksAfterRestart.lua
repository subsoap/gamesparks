local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

AddCallbacksAfterRestart = {}
AddCallbacksAfterRestart.mFinished = false

local writeText = nil
local mCurrInstance = nil

local function part6()
  writeText("PASSED!\n")
  
  AddCallbacksAfterRestart.mFinished = true
end

local function part5(timedout)
  assert(not timedout, "Callback not called after durable restart.")
  
  GSHelperMethods.waitForShutdown(mCurrInstance, function()
    part6()
  end)
end

local function part4()
  mCurrInstance.setNetworkAvailable(true)
  
  mCurrInstance = GSHelperMethods.createInstanceAndConnect("AddCallbacksAfterRestart")
    
  mCurrInstance.setDurableQueuePaused(false)
    
  local callbackEvent = AutoResetEvent.new(false)
    
  mCurrInstance.setAuthenticatedCallback(function(userId)
    mCurrInstance.setCallbackDurableRequest(0, function()
      AutoResetEvent.set(callbackEvent)
    end)
  end)
  
  AutoResetEvent.waitOne(callbackEvent, 20, function(timedout)
    part5(timedout)
  end)
end

local function part3()
  mCurrInstance.clearDurableQueue()
  
  local request = GSHelperMethods.getLogRequest(mCurrInstance)
  
  mCurrInstance.setNetworkAvailable(false)

  request:setDurable(true)
  request:send(nil)
  
  assert(mCurrInstance.getNumPersistentItemsToSend() == 1)
  
  GSHelperMethods.waitForShutdown(mCurrInstance, function()
    part4()
  end)
end

local function part2()
  mCurrInstance.setDurableQueuePaused(true)

  GSHelperMethods.waitForDeviceAuthentication(mCurrInstance, function()
    part3()
  end)
end

function AddCallbacksAfterRestart:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("AddCallbacksAfterRestart => ")
  
  print("##############################################")
  print("### AddCallbacksAfterRestart               ###")
  print("##############################################")
  
  mCurrInstance = GSHelperMethods.createInstanceWaitForAvailable("AddCallbacksAfterRestart", function()
    part2()
  end)
end

return AddCallbacksAfterRestart