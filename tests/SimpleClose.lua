local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

SimpleClose = {}
SimpleClose.mFinished = false

local writeText = nil

local function part2()
  writeText("PASSED!\n")
  
  SimpleClose.mFinished = true
end

function SimpleClose:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("SimpleClose => ")
  
  print("##############################################")
  print("### SimpleClose                            ###")
  print("##############################################")
  
  GSHelperMethods.connectTest("SIMPLE_CLOSE", part2)
end

return SimpleClose