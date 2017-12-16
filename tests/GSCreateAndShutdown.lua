local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

GSCreateAndShutdown = {}
GSCreateAndShutdown.mFinished = false

local writeText = nil

local function part3(timedout)
  assert(not timedout, "GS did not disconnect.")
  
  local gs = GSHelperMethods.getDefaultInstance()
    
  assert(not gs.isAvailable(), "GS was still available.")
  
  assert(gs.getNumItemsToSend() == 0, "There are still requests in the queue.")
  
  writeText("PASSED!\n")
  
  GSCreateAndShutdown.mFinished = true
end

local function part2(timedout)
  assert(not timedout, "GS was never available.")

  local gs = GSHelperMethods.getDefaultInstance()
  
  local ev = AutoResetEvent.new(false)
  
  gs.setAvailabilityCallback(function(isAvailable)
    if not isAvailable then
      AutoResetEvent.set(ev)
    end
  end)
  
  GSHelperMethods.shutDown(gs, nil)
  
  AutoResetEvent.waitOne(ev, GSHelperMethods.REQUEST_TIMEOUT, part3)
end

function GSCreateAndShutdown:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("GSCreateAndShutdown => ")
  
  print("##############################################")
  print("### GSCreateAndShutdown                    ###")
  print("##############################################")
  
  local gs = GSHelperMethods.createDefaultInstance()
  
  local ev = AutoResetEvent.new(false)
    
  assert(gs, "GS instance is null.")
    
  assert(not gs.isAvailable(), "GS was available from the start.")
    
  gs.setAvailabilityCallback(function(isAvailable)
    if isAvailable then
      AutoResetEvent.set(ev)
    end
  end)
    
  GSHelperMethods.connectDefaultInstance()
    
  AutoResetEvent.waitOne(ev, GSHelperMethods.REQUEST_TIMEOUT, part2)
end

return GSCreateAndShutdown