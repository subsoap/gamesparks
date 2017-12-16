local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestWithServerScriptsVersions = require("tests.RT.TestWithServerScriptsVersions")

local TestsSendRTDataAndGetAJSIntAndFloatArrayUDPSEQUENCED = {}
local TestsSendRTDataAndGetAJSIntAndFloatArrayUDPSEQUENCED_mt = {__index = TestsSendRTDataAndGetAJSIntAndFloatArrayUDPSEQUENCED}

TestsSendRTDataAndGetAJSIntAndFloatArrayUDPSEQUENCED.mFinished = false

local writeText = nil

function TestsSendRTDataAndGetAJSIntAndFloatArrayUDPSEQUENCED.new()
  local instance = TestWithServerScriptsVersions.new()
  
  return setmetatable(instance, TestsSendRTDataAndGetAJSIntAndFloatArrayUDPSEQUENCED_mt)
end

setmetatable(TestsSendRTDataAndGetAJSIntAndFloatArrayUDPSEQUENCED, {__index = TestWithServerScriptsVersions})

function TestsSendRTDataAndGetAJSIntAndFloatArrayUDPSEQUENCED:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestsSendRTDataAndGetAJSIntAndFloatArrayUDPSEQUENCED => ")
  
  print("###########################################################")
  print("### TestsSendRTDataAndGetAJSIntAndFloatArrayUDPSEQUENCED###")
  print("###########################################################")
  
  self:launch(GameSparksRT.deliveryIntent.UNRELIABLE_SEQUENCED, function()
    writeText("PASSED!\n")
    
    TestsSendRTDataAndGetAJSIntAndFloatArrayUDPSEQUENCED.mFinished = true
  end,
  {"ak4qhSP90ROobl4IvmeW3awd+Oqg1ZVUa7AR0O1vIkHt8hamptVKHQIjYuESNCgG+wrJgz79PxrCenmjD3VALWjOYJO48k/baoHpw5RQe0Xu4c49gPd0aJcOMO9yNWSUZVDLE0QHfzZxkWGnWQtdM823aELOfKCNBfDJMrmkbft555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzdHlJ3HhNBZhRIs6v6FznBcGx2o2/3CwJwiRZSn0VobzMEGRo+cgV41r8vOCUc/DysoHr8NW1CpzAkBWcfllb/ZA==",
  "TTJd9VAjGbXP/yJjW3XfsKwd+Oqg1ZVUa7AR0O1vIkHt8hamptVKHQIjYuESNCgG+wrJgz79PxrCenmjD3VALRaPcogMELGDua8SrUqpdn/u4c49gPd0aJcOMO9yNWSUZVDLE0QHfzZxkWGnWQtdM823aELOfKCNBfDJMrmkbft555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzdHlJ3HhNBZhRIs6v6FznBcGx2o2/3CwJwiRZSn0VobzMEGRo+cgV41r8vOCUc/DysW+Cw91dsW9zMgklC2XGTWg=="})
end

return TestsSendRTDataAndGetAJSIntAndFloatArrayUDPSEQUENCED