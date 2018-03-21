local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

CloseAfterHandshake = {}
CloseAfterHandshake.mFinished = false

local writeText = nil

local function part2()
  writeText("PASSED!\n")
  
  CloseAfterHandshake.mFinished = true
end

function CloseAfterHandshake:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("CloseAfterHandshake => ")
  
  print("##############################################")
  print("### CloseAfterHandshake                    ###")
  print("##############################################")
  
  GSHelperMethods.connectTest("CLOSE_AFTER_HANDSHAKE", part2)
end

return CloseAfterHandshake