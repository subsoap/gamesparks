local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

Shutdown = {}
Shutdown.mFinished = false

local writeText = nil
local currInstance = nil

local function part3()
  writeText("PASSED!\n")
  
  Shutdown.mFinished = true
end

local function part2()
  GSHelperMethods.waitForShutdown(currInstance, part3)
end

function Shutdown:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("Shutdown => ")
  
  print("##############################################")
  print("### Shutdown                               ###")
  print("##############################################")
  
  currInstance = GSHelperMethods.createInstanceWaitForAvailable("Shutdown", part2)
end

return Shutdown