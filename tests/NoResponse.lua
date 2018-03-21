local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

NoResponse = {}
NoResponse.mFinished = false

local writeText = nil

local function part2()
  writeText("PASSED!\n")
  
  NoResponse.mFinished = true
end

function NoResponse:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("NoResponse => ")
  
  print("##############################################")
  print("### NoResponse                             ###")
  print("##############################################")
  
  GSHelperMethods.connectTest("NO_RESPONSE", part2)
end

return NoResponse