local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

ShutdownWithNoNetwork = {}
ShutdownWithNoNetwork.mFinished = false

local writeText = nil
local currInstance = nil

local function part3()
  currInstance.setNetworkAvailable(true)
  
  writeText("PASSED!\n")
  
  ShutdownWithNoNetwork.mFinished = true
end

local function part2()
  currInstance.setNetworkAvailable(false)

  GSHelperMethods.waitForShutdown(currInstance, part3)
end

function ShutdownWithNoNetwork:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("ShutdownWithNoNetwork => ")
  
  print("##############################################")
  print("### ShutdownWithNoNetwork                  ###")
  print("##############################################")
  
  currInstance = GSHelperMethods.createInstanceWaitForAvailable("ShutdownWithNoNetwork", part2)
end

return ShutdownWithNoNetwork