local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestsSessionsDoBasicCommunication = require("tests.RT.TestsSessionsDoBasicCommunication")

local TestsSessionsDoBasicCommunicationUDP = {}
local TestsSessionsDoBasicCommunicationUDP_mt = {__index = TestsSessionsDoBasicCommunicationUDP}

TestsSessionsDoBasicCommunicationUDP.mFinished = false

local writeText = nil

function TestsSessionsDoBasicCommunicationUDP.new()
  local instance = TestBase.new()
  
  return setmetatable(instance, TestsSessionsDoBasicCommunicationUDP_mt)
end

setmetatable(TestsSessionsDoBasicCommunicationUDP, {__index = TestBase})

function TestsSessionsDoBasicCommunicationUDP:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestsSessionsDoBasicCommunicationUDP => ")
  
  print("##############################################")
  print("### TestsSessionsDoBasicCommunicationUDP   ###")
  print("##############################################")
  
  TestsSessionsDoBasicCommunication.launch(GameSparksRT.deliveryIntent.UNRELIABLE, function()
    writeText("PASSED!\n")
    
    TestsSessionsDoBasicCommunicationUDP.mFinished = true
  end,
  {"mJlW72CCtcGcfGGmTLiaXgpYhWosEfRgYa8VgURgu/KnKqlWoHNqygrChwL6o6odA0qqR4rhpYJbzbgmIbKCAGjOYJO48k/baoHpw5RQe0UcJ2RVzyDs0fcnvDeSjfbMofCGZAh209fCfaqJTEdJxyVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5FCkg2bPbaD3haYhdEHJK0gpYhWosEfRgYa8VgURgu/IQL83eI4JjOVJrXWw/hyAWLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "KIjWqkbuSBRJzlw6MHWBWgpYhWosEfRgYa8VgURgu/KnKqlWoHNqygrChwL6o6odA0qqR4rhpYJbzbgmIbKCABaPcogMELGDua8SrUqpdn8cJ2RVzyDs0fcnvDeSjfbMofCGZAh209fCfaqJTEdJxyVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5FCkg2bPbaD3haYhdEHJK0gpYhWosEfRgYa8VgURgu/IQL83eI4JjOVJrXWw/hyAWLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "x9nTN/4cUYl6E1PvaWXg8wpYhWosEfRgYa8VgURgu/KnKqlWoHNqygrChwL6o6odA0qqR4rhpYJbzbgmIbKCACanzlW3uAqck8Ivc74NMLEcJ2RVzyDs0fcnvDeSjfbMofCGZAh209fCfaqJTEdJxyVphxXy8favOb+bz+7hgCU2CAf0rR1MwIVhUvsjF36xhVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5FCkg2bPbaD3haYhdEHJK0gpYhWosEfRgYa8VgURgu/IQL83eI4JjOVJrXWw/hyAWLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "Hvb29VNbei82SR0/jEY2KQpYhWosEfRgYa8VgURgu/KnKqlWoHNqygrChwL6o6odA0qqR4rhpYJbzbgmIbKCAMwAPE8vj0jlQQ5bYbRejJ4cJ2RVzyDs0fcnvDeSjfbMofCGZAh209fCfaqJTEdJxyVphxXy8favOb+bz+7hgCVpmW6rm0PCAros1mmWevkUhVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5FCkg2bPbaD3haYhdEHJK0gpYhWosEfRgYa8VgURgu/IQL83eI4JjOVJrXWw/hyAWLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
end

return TestsSessionsDoBasicCommunicationUDP