local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

RemoveDurableEntry = {}
RemoveDurableEntry.mFinished = false

local writeText = nil
local mCurrInstance = nil

local function part4()
  writeText("PASSED!\n")
  
  RemoveDurableEntry.mFinished = true
end

local function part3()
  mCurrInstance.clearDurableQueue()
 
  mCurrInstance.setNetworkAvailable(false)

  local request = GSHelperMethods.getLogRequest(mCurrInstance)

  request:setDurable(true)
  request:send(nil)
  
  assert(mCurrInstance.getNumPersistentItemsToSend() == 1)
    
  mCurrInstance.removeDurableRequest(0)
  
  assert(mCurrInstance.getNumPersistentItemsToSend() == 0)
  
  mCurrInstance.setNetworkAvailable(true)
  
  GSHelperMethods.waitForShutdown(mCurrInstance, function()
    part4()
  end)
end

local function part2()
  GSHelperMethods.waitForDeviceAuthentication(mCurrInstance, function()
    part3()
  end)
end

function RemoveDurableEntry:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("RemoveDurableEntry => ")
  
  print("##############################################")
  print("### RemoveDurableEntry                     ###")
  print("##############################################")
  
  mCurrInstance = GSHelperMethods.createInstanceWaitForAvailable("RemoveDurableEntry", function()
    part2()
  end)
end

return RemoveDurableEntry