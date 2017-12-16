local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestJavaScriptExtractCorrectDataFromRTDataObject = require("tests.RT.TestJavaScriptExtractCorrectDataFromRTDataObject")

local TestJavaScriptExtractCorrectDataFromRTDataObjectUDP = {}
local TestJavaScriptExtractCorrectDataFromRTDataObjectUDP_mt = {__index = TestJavaScriptExtractCorrectDataFromRTDataObjectUDP}

TestJavaScriptExtractCorrectDataFromRTDataObjectUDP.mFinished = false

local writeText = nil

function TestJavaScriptExtractCorrectDataFromRTDataObjectUDP.new()
  local instance = TestJavaScriptExtractCorrectDataFromRTDataObject.new()
  
  return setmetatable(instance, TestJavaScriptExtractCorrectDataFromRTDataObjectUDP_mt)
end

setmetatable(TestJavaScriptExtractCorrectDataFromRTDataObjectUDP, {__index = TestJavaScriptExtractCorrectDataFromRTDataObject})

function TestJavaScriptExtractCorrectDataFromRTDataObjectUDP:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestJavaScriptExtractCorrectDataFromRTDataObjectUDP => ")
  
  print("##########################################################")
  print("### TestJavaScriptExtractCorrectDataFromRTDataObjectUDP###")
  print("##########################################################")
  
  self:launch(GameSparksRT.deliveryIntent.UNRELIABLE, function()
    writeText("PASSED!\n")
    
    TestJavaScriptExtractCorrectDataFromRTDataObjectUDP.mFinished = true
  end,
  {"GRjih0kC2luGyWwiP9zJ8+XkYkrDBDQvl9iuxv/tzAue776GDgyO/qpsl6cyjcRsiE/eTy1l6LQSlequs3YHx2jOYJO48k/baoHpw5RQe0Viq7xKvrXY66CQJeIB3KvqwkjGckP2UYE84obhJOV0WM23aELOfKCNBfDJMrmkbft555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzdO/VSilO+j55d+FieaNV9sMsky94xwZR4rzx3uUQHl9E3s/QClSJMOnyCdX0GKxVbtNhaaXDRLEWojCT8m2ak+Q==",
  "J3WYGBRxdci5zXMFO6HCxeXkYkrDBDQvl9iuxv/tzAue776GDgyO/qpsl6cyjcRsiE/eTy1l6LQSlequs3YHxxaPcogMELGDua8SrUqpdn9iq7xKvrXY66CQJeIB3KvqwkjGckP2UYE84obhJOV0WM23aELOfKCNBfDJMrmkbft555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzdO/VSilO+j55d+FieaNV9sMsky94xwZR4rzx3uUQHl9E3s/QClSJMOnyCdX0GKxVbdG8opsro77RV9q/DMoBLrw=="})
end

return TestJavaScriptExtractCorrectDataFromRTDataObjectUDP