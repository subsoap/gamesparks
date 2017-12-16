local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

PauseDurableQueue = {}
PauseDurableQueue.mFinished = false

local writeText = nil
local mCurrInstance = nil

local function part6()
  assert(mCurrInstance.getNumPersistentItemsToSend() == 0)
  
  writeText("PASSED!\n")
  
  PauseDurableQueue.mFinished = true
end

local function part5()
  assert(mCurrInstance.getNumPersistentItemsToSend() == 1)
    
  mCurrInstance.setDurableQueuePaused(false)
  
  GSHelperMethods.waitForShutdown(mCurrInstance, function()
    part6()
  end)
end

local function part4()
  mCurrInstance.setNetworkAvailable(true)
  
  mCurrInstance = GSHelperMethods.createInstanceWaitForAvailable("PauseDurableQueue", function()
    part5()
  end)
end

local function part3()
  mCurrInstance.clearDurableQueue()
  
  mCurrInstance.setDurableQueuePaused(true)
  
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
  GSHelperMethods.waitForDeviceAuthentication(mCurrInstance, function()
    part3()
  end)
end

function PauseDurableQueue:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("PauseDurableQueue => ")
  
  print("##############################################")
  print("### PauseDurableQueue                      ###")
  print("##############################################")
  
  mCurrInstance = GSHelperMethods.createInstanceWaitForAvailable("PauseDurableQueue", function()
    part2()
  end)
end

return PauseDurableQueue