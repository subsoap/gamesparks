local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

NoResponseAfterHandshake = {}
NoResponseAfterHandshake.mFinished = false

local writeText = nil

local function part2()
  writeText("PASSED!\n")
  
  NoResponseAfterHandshake.mFinished = true
end

function NoResponseAfterHandshake:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("NoResponseAfterHandshake => ")
  
  print("##############################################")
  print("### NoResponseAfterHandshake               ###")
  print("##############################################")

  GSHelperMethods.deliverTest("NO_RESPONSE_AFTER_HANDSHAKE", 1, part2)
end

return NoResponseAfterHandshake