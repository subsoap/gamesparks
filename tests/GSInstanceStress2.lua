local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

GSInstanceStress2 = {}
GSInstanceStress2.mFinished = false

local writeText = nil
local currInstance = nil
local i = 0

local function part2()
  if i < 50 then
    print("*** GSInstanceStress2 " .. tostring(i) .. " ***")
  
    currInstance = GSHelperMethods.createInstanceWaitForAvailable("GSInstanceStress2", function()
      GSHelperMethods.waitForShutdownInstance("GSInstanceStress2", function()
        i = i + 1
        
        timer.seconds(1.5, function() part2() end)       
      end)
    end)
  else
    writeText("PASSED!\n")
  
    GSInstanceStress2.mFinished = true
  end
end

function GSInstanceStress2:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("GSInstanceStress2 => ")
  
  print("##############################################")
  print("### GSInstanceStress2                      ###")
  print("##############################################")
  
  part2()
end

return GSInstanceStress2