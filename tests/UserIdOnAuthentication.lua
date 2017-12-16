local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

UserIdOnAuthentication = {}
UserIdOnAuthentication.mFinished = false

local writeText = nil
local currInstance = nil
local oldUserId = ""

local function part7()
  assert(oldUserId == GSHelperMethods.userId)
  
  writeText("PASSED!\n")
  
  UserIdOnAuthentication.mFinished = true
end

local function part6()
  assert(oldUserId == GSHelperMethods.userId)
    
  GSHelperMethods.waitForShutdownInstance("UserIdOnAuthentication", part7)
end

local function part5()
  GSHelperMethods.waitForDeviceAuthentication(currInstance, part6)
end

local function part4()
  currInstance = GSHelperMethods.createInstanceWaitForAvailable("UserIdOnAuthentication", part5)
end

local function part3()
  oldUserId = GSHelperMethods.userId
    
  GSHelperMethods.waitForShutdownInstance("UserIdOnAuthentication", part4)
end

local function part2()
  GSHelperMethods.waitForDeviceAuthentication(currInstance, part3)
end

function UserIdOnAuthentication:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("UserIdOnAuthentication => ")
  
  print("##############################################")
  print("### UserIdOnAuthentication                 ###")
  print("##############################################")
  
  currInstance = GSHelperMethods.createInstanceWaitForAvailable("UserIdOnAuthentication", part2)
end

return UserIdOnAuthentication