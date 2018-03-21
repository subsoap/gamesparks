local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

DurableConcurrentRequests = {}
DurableConcurrentRequests.mFinished = false

local writeText = nil

local function part2()
  writeText("PASSED!\n")
  
  DurableConcurrentRequests.mFinished = true
end

function DurableConcurrentRequests:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("DurableConcurrentRequests => ")
  
  print("##############################################")
  print("### DurableConcurrentRequests              ###")
  print("##############################################")

  GSHelperMethods.deliverTest("DURABLE_CONCURRENT_REQUESTS_10", 10, part2)
end

return DurableConcurrentRequests