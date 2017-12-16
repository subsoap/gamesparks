local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

DurableNamedInstance = {}
DurableNamedInstance.mFinished = false

local writeText = nil
local mCurrInstance = nil
local mBackendMessage = nil
local mMessageEvent = nil

local function part7()
  writeText("PASSED!\n")
  
  DurableNamedInstance.mFinished = true
end

local function part6(timedout)
  assert(not timedout, "Durable was never sent.")
  
  assert(mBackendMessage);
  
  GSHelperMethods.waitForShutdown(mCurrInstance, function()
    part7()
  end)
end

local function part5()
  AutoResetEvent.waitOne(mMessageEvent, GSHelperMethods.REQUEST_TIMEOUT, function(timedout)  
    part6(timedout)
  end)
end

local function part4()
  assert(not mBackendMessage)
  
  mCurrInstance.setNetworkAvailable(true)
  
  mCurrInstance = GSHelperMethods.createInstanceWaitForAvailable("DurableNamedInstance_1", function()
    part5()
  end)
end

local function part3()
  mCurrInstance.clearDurableQueue()
  
  local request = GSHelperMethods.getLogRequest(mCurrInstance)
  
  mCurrInstance.setNetworkAvailable(false)
  
  mMessageEvent = AutoResetEvent.new(false)
  
  mCurrInstance.setMessageHandlerCallback(function(message)
    mBackendMessage = message
    AutoResetEvent.set(mMessageEvent)  
  end)

  request:setDurable(true)
  request:send(nil)
  
  assert(mCurrInstance.getNumPersistentItemsToSend() > 0)
  
  GSHelperMethods.waitForShutdown(mCurrInstance, function()
    part4()
  end)
end

local function part2()
  GSHelperMethods.waitForDeviceAuthentication(mCurrInstance, function()
    part3()
  end)
end

function DurableNamedInstance:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("DurableNamedInstance => ");
  
  print("##############################################")
  print("## DurableNamedInstance                    ###")
  print("##############################################")
  
  mCurrInstance = GSHelperMethods.createInstanceWaitForAvailable("DurableNamedInstance_1", function()
    part2()
  end)
end

return DurableNamedInstance