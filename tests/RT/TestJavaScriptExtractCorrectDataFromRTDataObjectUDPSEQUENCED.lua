local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestJavaScriptExtractCorrectDataFromRTDataObject = require("tests.RT.TestJavaScriptExtractCorrectDataFromRTDataObject")

local TestJavaScriptExtractCorrectDataFromRTDataObjectUDPSEQUENCED = {}
local TestJavaScriptExtractCorrectDataFromRTDataObjectUDPSEQUENCED_mt = {__index = TestJavaScriptExtractCorrectDataFromRTDataObjectUDPSEQUENCED}

TestJavaScriptExtractCorrectDataFromRTDataObjectUDPSEQUENCED.mFinished = false

local writeText = nil

function TestJavaScriptExtractCorrectDataFromRTDataObjectUDPSEQUENCED.new()
  local instance = TestJavaScriptExtractCorrectDataFromRTDataObject.new()
  
  return setmetatable(instance, TestJavaScriptExtractCorrectDataFromRTDataObjectUDPSEQUENCED_mt)
end

setmetatable(TestJavaScriptExtractCorrectDataFromRTDataObjectUDPSEQUENCED, {__index = TestJavaScriptExtractCorrectDataFromRTDataObject})

function TestJavaScriptExtractCorrectDataFromRTDataObjectUDPSEQUENCED:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestJavaScriptExtractCorrectDataFromRTDataObjectUDPSEQUENCED => ")
  
  print("#############################################################")
  print("### TestJavaScriptExtractCorrectDataFromRTDataObjectUDPSEQ###")
  print("#############################################################")
  
  self:launch(GameSparksRT.deliveryIntent.UNRELIABLE_SEQUENCED, function()
    writeText("PASSED!\n")
    
    TestJavaScriptExtractCorrectDataFromRTDataObjectUDPSEQUENCED.mFinished = true
  end,
  {"cq24Dd/NHnNE7AAGpfHHaGADZ+1UgXSWVuXytoEy70PBbvdipvzGNID+YIczXGrxsJKtB2cgGrzEFMO73hj36WjOYJO48k/baoHpw5RQe0UN560xBvf8OfmfP8SgqY0jCPWDbc1wU+v9JWAL2KUAQs23aELOfKCNBfDJMrmkbft555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzd0bz0XOnF5N4a8xQF/TloalCoM4X/DTkoCFmbOuUkjo1I2WgJgrQi49+eXlc8FErlUzL6nF3ul2baBkQnJRabUg==",
  "/mNuXBHtFf3oZ4WsShdj5WADZ+1UgXSWVuXytoEy70PBbvdipvzGNID+YIczXGrxsJKtB2cgGrzEFMO73hj36RaPcogMELGDua8SrUqpdn8N560xBvf8OfmfP8SgqY0jCPWDbc1wU+v9JWAL2KUAQs23aELOfKCNBfDJMrmkbft555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzd0bz0XOnF5N4a8xQF/TloalCoM4X/DTkoCFmbOuUkjo1I2WgJgrQi49+eXlc8FErlC5CVuA/UTxs6nPLoz1Dhog=="})
end

return TestJavaScriptExtractCorrectDataFromRTDataObjectUDPSEQUENCED