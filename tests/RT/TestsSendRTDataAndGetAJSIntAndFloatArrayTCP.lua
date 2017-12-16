local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestWithServerScriptsVersions = require("tests.RT.TestWithServerScriptsVersions")

local TestsSendRTDataAndGetAJSIntAndFloatArrayTCP = {}
local TestsSendRTDataAndGetAJSIntAndFloatArrayTCP_mt = {__index = TestsSendRTDataAndGetAJSIntAndFloatArrayTCP}

TestsSendRTDataAndGetAJSIntAndFloatArrayTCP.mFinished = false

local writeText = nil

function TestsSendRTDataAndGetAJSIntAndFloatArrayTCP.new()
  local instance = TestWithServerScriptsVersions.new()
  
  return setmetatable(instance, TestsSendRTDataAndGetAJSIntAndFloatArrayTCP_mt)
end

setmetatable(TestsSendRTDataAndGetAJSIntAndFloatArrayTCP, {__index = TestWithServerScriptsVersions})

function TestsSendRTDataAndGetAJSIntAndFloatArrayTCP:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestsSendRTDataAndGetAJSIntAndFloatArrayTCP => ")
  
  print("##################################################")
  print("### TestsSendRTDataAndGetAJSIntAndFloatArrayTCP###")
  print("##################################################")
  
  self:launch(GameSparksRT.deliveryIntent.RELIABLE, function()
    writeText("PASSED!\n")
    
    TestsSendRTDataAndGetAJSIntAndFloatArrayTCP.mFinished = true
  end,
  {"Mg3q35wFqm+Bn4wySNJLv8afY2aWO1v24pDLm16yBV/ybRITdW4zJpnWpHRBIKnqG+ek3Z0Qa9v7L4BA/HtDaWjOYJO48k/baoHpw5RQe0UEvlgfH8fv4OeswVPz1FpXOeltu3/iANwlmDNI2ZDjH823aELOfKCNBfDJMrmkbft555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzdOamvOmWIhSUHQ0YAwb9xn41OPc0+YUTvG4nP7SwWGaEbzPS2gSz2QXlh7Ag6MwOzUzL6nF3ul2baBkQnJRabUg==",
  "WYtgL6H54IRzZY662iERJcafY2aWO1v24pDLm16yBV/ybRITdW4zJpnWpHRBIKnqG+ek3Z0Qa9v7L4BA/HtDaRaPcogMELGDua8SrUqpdn8EvlgfH8fv4OeswVPz1FpXOeltu3/iANwlmDNI2ZDjH823aELOfKCNBfDJMrmkbft555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzdOamvOmWIhSUHQ0YAwb9xn41OPc0+YUTvG4nP7SwWGaEbzPS2gSz2QXlh7Ag6MwOzC5CVuA/UTxs6nPLoz1Dhog=="})
end

return TestsSendRTDataAndGetAJSIntAndFloatArrayTCP