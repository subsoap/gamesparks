local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

IterateDurableEntries = {}
IterateDurableEntries.mFinished = false

local AMOUNT_OF_REQUESTS = 3
local writeText = nil
local mCurrInstance = nil

local function part4()
  writeText("PASSED!\n")
  
  IterateDurableEntries.mFinished = true
end

local function part3()
  mCurrInstance.clearDurableQueue()
 
  mCurrInstance.setNetworkAvailable(false)

  for i = 1, AMOUNT_OF_REQUESTS do
    local request = GSHelperMethods.getLogRequest(mCurrInstance)
  
    request:setDurable(true)
    request:setAttribute("foo", tostring(i))
    request:send(nil)
  end
  
  assert(mCurrInstance.getNumPersistentItemsToSend() == AMOUNT_OF_REQUESTS)
    
  for i = 1, AMOUNT_OF_REQUESTS do
    assert(mCurrInstance.compareAttributeDurableRequest(i - 1, "foo", tostring(i)))
  end
    
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

function IterateDurableEntries:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("IterateDurableEntries => ")
  
  print("##############################################")
  print("### IterateDurableEntries                  ###")
  print("##############################################")
  
  mCurrInstance = GSHelperMethods.createInstanceWaitForAvailable("IterateDurableEntries", function()
    part2()
  end)
end

return IterateDurableEntries