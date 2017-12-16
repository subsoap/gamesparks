local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestJavaScriptExtractCorrectDataFromRTDataObject = require("tests.RT.TestJavaScriptExtractCorrectDataFromRTDataObject")

local TestJavaScriptExtractCorrectDataFromRTDataObjectTCP = {}
local TestJavaScriptExtractCorrectDataFromRTDataObjectTCP_mt = {__index = TestJavaScriptExtractCorrectDataFromRTDataObjectTCP}

TestJavaScriptExtractCorrectDataFromRTDataObjectTCP.mFinished = false

local writeText = nil

function TestJavaScriptExtractCorrectDataFromRTDataObjectTCP.new()
  local instance = TestJavaScriptExtractCorrectDataFromRTDataObject.new()
  
  return setmetatable(instance, TestJavaScriptExtractCorrectDataFromRTDataObjectTCP_mt)
end

setmetatable(TestJavaScriptExtractCorrectDataFromRTDataObjectTCP, {__index = TestJavaScriptExtractCorrectDataFromRTDataObject})

function TestJavaScriptExtractCorrectDataFromRTDataObjectTCP:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestJavaScriptExtractCorrectDataFromRTDataObjectTCP => ")
  
  print("##########################################################")
  print("### TestJavaScriptExtractCorrectDataFromRTDataObjectTCP###")
  print("##########################################################")
  
  self:launch(GameSparksRT.deliveryIntent.RELIABLE, function()
    writeText("PASSED!\n")
    
    TestJavaScriptExtractCorrectDataFromRTDataObjectTCP.mFinished = true
  end,
  {"R+oI6zsogiB1Xwuj786uIPpehAyE9jj562irZySghvqmg35SW5p2SB6Q2VcvTMDRP7MPQ0WZu76mIhnknMrc9WjOYJO48k/baoHpw5RQe0XG8MhCwEFdGRmTl69kSEV7QHHZdpre8Mw7NiHQ6mQAps23aELOfKCNBfDJMrmkbft555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzd5IRAqT/GRagXpGehPvAX8vEVTGX3Q7VufEUhe2tTxkIY6gbS5mrXDgfkpqjvJ2l8LfMMHV6QhfJDJZjmPiY+zQ==",
  "o9dM1TNCzE61gHgqI3U6h/pehAyE9jj562irZySghvqmg35SW5p2SB6Q2VcvTMDRP7MPQ0WZu76mIhnknMrc9RaPcogMELGDua8SrUqpdn/G8MhCwEFdGRmTl69kSEV7QHHZdpre8Mw7NiHQ6mQAps23aELOfKCNBfDJMrmkbft555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzd5IRAqT/GRagXpGehPvAX8vEVTGX3Q7VufEUhe2tTxkIY6gbS5mrXDgfkpqjvJ2l8AZBQ1xeNnqqnwyFsd8J2sw=="})
end

return TestJavaScriptExtractCorrectDataFromRTDataObjectTCP