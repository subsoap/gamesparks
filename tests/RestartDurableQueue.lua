local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

RestartDurableQueue = {}
RestartDurableQueue.mFinished = false

local writeText = nil
local mCurrInstance = nil
local mLogResponse = nil
local mLogResponseEvent = nil

local function part6()
  writeText("PASSED!\n")
  
  RestartDurableQueue.mFinished = true
end

local function part5(timedout)
  assert(not timedout, "Timeout. Durable was not sent.")
    
  GSHelperMethods.waitForShutdown(mCurrInstance, function()
    part6()
  end)
end

local function part4(timedout)
  assert(timedout, "Durable was sent, when it should not.")
    
  assert(not mLogResponse)
    
  assert(mCurrInstance.getNumPersistentItemsToSend() == 1)
    
  mCurrInstance.setDurableQueuePaused(false)
  
  AutoResetEvent.waitOne(mLogResponseEvent, GSHelperMethods.REQUEST_TIMEOUT, function(timedout)
    part5(timedout)
  end)
end

local function part3()
  mCurrInstance.clearDurableQueue()
  
  local request = GSHelperMethods.getLogRequest(mCurrInstance)
  
  mLogResponseEvent = AutoResetEvent.new(false)
 
  request:setDurable(true)
  request:send(function(resp)
    mLogResponse = resp
    AutoResetEvent.set(mLogResponseEvent)
  end)
  
  AutoResetEvent.waitOne(mLogResponseEvent, GSHelperMethods.REQUEST_TIMEOUT, function(timedout)  
    part4(timedout)
  end)
end

local function part2()
  mCurrInstance.setDurableQueuePaused(true)
  
  GSHelperMethods.waitForDeviceAuthentication(mCurrInstance, function()
    part3()
  end)
end

function RestartDurableQueue:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("RestartDurableQueue => ")
  
  print("##############################################")
  print("### RestartDurableQueue                    ###")
  print("##############################################")
  
  mCurrInstance = GSHelperMethods.createInstanceWaitForAvailable("RestartDurableQueue", function()
    part2()
  end)
end

return RestartDurableQueue