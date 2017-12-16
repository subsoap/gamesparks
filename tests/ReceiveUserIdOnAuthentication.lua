local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

ReceiveUserIdOnAuthentication = {}
ReceiveUserIdOnAuthentication.mFinished = false

local writeText = nil
local currInstance = nil

local function part4()
  writeText("PASSED!\n")
  
  ReceiveUserIdOnAuthentication.mFinished = true
end

local function part3()
  assert(GSHelperMethods.userId)
  assert(GSHelperMethods.userId ~= "")
    
  GSHelperMethods.waitForShutdownInstance("ReceiveUserIdOnAuthentication", part4)
end

local function part2()
  GSHelperMethods.waitForDeviceAuthentication(currInstance, part3)
end

function ReceiveUserIdOnAuthentication:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("ReceiveUserIdOnAuthentication => ")
  
  print("##############################################")
  print("### ReceiveUserIdOnAuthentication          ###")
  print("##############################################")
  
  currInstance = GSHelperMethods.createInstanceWaitForAvailable("ReceiveUserIdOnAuthentication", part2)
end

return ReceiveUserIdOnAuthentication