local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

IncompleteHandshake = {}
IncompleteHandshake.mFinished = false

local writeText = nil

local function part2()
  writeText("PASSED!\n")
  
  IncompleteHandshake.mFinished = true
end

function IncompleteHandshake:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("IncompleteHandshake => ")
  
  print("##############################################")
  print("### IncompleteHandshake                    ###")
  print("##############################################")
  
  GSHelperMethods.connectTest("INCOMPLETE_HANDSHAKE", part2)
end

return IncompleteHandshake