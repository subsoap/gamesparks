local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestWithServerScriptsVersions = require("tests.RT.TestWithServerScriptsVersions")

local TestsSendRTDataAndGetAJSIntAndFloatArrayUDP = {}
local TestsSendRTDataAndGetAJSIntAndFloatArrayUDP_mt = {__index = TestsSendRTDataAndGetAJSIntAndFloatArrayUDP}

TestsSendRTDataAndGetAJSIntAndFloatArrayUDP.mFinished = false

local writeText = nil

function TestsSendRTDataAndGetAJSIntAndFloatArrayUDP.new()
  local instance = TestWithServerScriptsVersions.new()
  
  return setmetatable(instance, TestsSendRTDataAndGetAJSIntAndFloatArrayUDP_mt)
end

setmetatable(TestsSendRTDataAndGetAJSIntAndFloatArrayUDP, {__index = TestWithServerScriptsVersions})

function TestsSendRTDataAndGetAJSIntAndFloatArrayUDP:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestsSendRTDataAndGetAJSIntAndFloatArrayUDP => ")
  
  print("##################################################")
  print("### TestsSendRTDataAndGetAJSIntAndFloatArrayUDP###")
  print("##################################################")
  
  self:launch(GameSparksRT.deliveryIntent.UNRELIABLE, function()
    writeText("PASSED!\n")
    
    TestsSendRTDataAndGetAJSIntAndFloatArrayUDP.mFinished = true
  end,
  {"03EQLtFh2N7gDSzimfP+/8GTRzNFwcj2NPe3bgqxoR8dBbASNLT8XbxpVZGAoNOaB6TIsoWOAO8vv9CT5j7IKWjOYJO48k/baoHpw5RQe0Wq4zpbJoI1fhJ0IhhwGtH0uESWWrjGX10Nyb8VmMNza823aELOfKCNBfDJMrmkbft555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzd4/N4cQPnnb5eHlUzyzy4tWwK8hr0XD6aSql3X8B0ylU7W0dNYKu6Gn4prWxLehkIqRQL8awj7ZrQgtYWTxhJmw==",
  "zrerSXyZ5Uvu3znjvvUtycGTRzNFwcj2NPe3bgqxoR8dBbASNLT8XbxpVZGAoNOaB6TIsoWOAO8vv9CT5j7IKRaPcogMELGDua8SrUqpdn+q4zpbJoI1fhJ0IhhwGtH0uESWWrjGX10Nyb8VmMNza823aELOfKCNBfDJMrmkbft555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzd4/N4cQPnnb5eHlUzyzy4tWwK8hr0XD6aSql3X8B0ylU7W0dNYKu6Gn4prWxLehkIiK98sEhmnFw9aP53USByGw=="})
end

return TestsSendRTDataAndGetAJSIntAndFloatArrayUDP