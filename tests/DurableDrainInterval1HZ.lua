local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

DurableDrainInterval1HZ = {}
DurableDrainInterval1HZ.mFinished = false

local writeText = nil

local function part2()
  writeText("PASSED!\n")
  
  DurableDrainInterval1HZ.mFinished = true
end

function DurableDrainInterval1HZ:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("DurableDrainInterval1HZ => ")
  
  print("##############################################")
  print("### DurableDrainInterval1HZ                ###")
  print("##############################################")

  GSHelperMethods.deliverTest("DURABLE_DRAIN_INTERVAL_1HZ", 10, part2)
end

return DurableDrainInterval1HZ