local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

DurableDefault = {}
DurableDefault.mFinished = false

local writeText = nil

local function part2()
  writeText("PASSED!\n")
  
  DurableDefault.mFinished = true
end

function DurableDefault:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("DurableDefault => ")
  
  print("##############################################")
  print("### DurableDefault                         ###")
  print("##############################################")

  GSHelperMethods.deliverTest("NO_RESPONSE_AFTER_HANDSHAKE", 10, part2)
end

return DurableDefault