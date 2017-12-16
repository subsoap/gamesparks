local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")
local TestsSessionsDoBasicCommunication = require("tests.RT.TestsSessionsDoBasicCommunication")

local TestsSessionsDoBasicCommunicationTCP = {}
local TestsSessionsDoBasicCommunicationTCP_mt = {__index = TestsSessionsDoBasicCommunicationTCP}

TestsSessionsDoBasicCommunicationTCP.mFinished = false

local writeText = nil

function TestsSessionsDoBasicCommunicationTCP.new()
  local instance = TestBase.new()
  
  return setmetatable(instance, TestsSessionsDoBasicCommunicationTCP_mt)
end

setmetatable(TestsSessionsDoBasicCommunicationTCP, {__index = TestBase})

function TestsSessionsDoBasicCommunicationTCP:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestsSessionsDoBasicCommunicationTCP => ")
  
  print("##############################################")
  print("### TestsSessionsDoBasicCommunicationTCP   ###")
  print("##############################################")
  
  TestsSessionsDoBasicCommunication.launch(GameSparksRT.deliveryIntent.RELIABLE, function()
    writeText("PASSED!\n")
    
    TestsSessionsDoBasicCommunicationTCP.mFinished = true
  end,
  {"HAwSCB7EzcQjLsCwbw6GpRJmU7+O1iHXk1l/LW413lg01t/KvRgLAjl1xkSWWeUpXe2kLVI/0qyuhy3BSJhfuGjOYJO48k/baoHpw5RQe0VJXmMjB1GPtQfgLw+NueiHGXylvMko6pFqOm+fSMQ6LyVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5dHJGc4dpevGs4JiJbhQ3HxJmU7+O1iHXk1l/LW413lh0R9VcNkmiK0129HLxA+XpLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "V/h45GMYiwayrKXSmhGoVhJmU7+O1iHXk1l/LW413lg01t/KvRgLAjl1xkSWWeUpXe2kLVI/0qyuhy3BSJhfuBaPcogMELGDua8SrUqpdn9JXmMjB1GPtQfgLw+NueiHGXylvMko6pFqOm+fSMQ6LyVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5dHJGc4dpevGs4JiJbhQ3HxJmU7+O1iHXk1l/LW413lh0R9VcNkmiK0129HLxA+XpLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "kMFOafCzVvRPbFjyt3qBKRJmU7+O1iHXk1l/LW413lg01t/KvRgLAjl1xkSWWeUpXe2kLVI/0qyuhy3BSJhfuCanzlW3uAqck8Ivc74NMLFJXmMjB1GPtQfgLw+NueiHGXylvMko6pFqOm+fSMQ6LyVphxXy8favOb+bz+7hgCU2CAf0rR1MwIVhUvsjF36xhVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5dHJGc4dpevGs4JiJbhQ3HxJmU7+O1iHXk1l/LW413lh0R9VcNkmiK0129HLxA+XpLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "Vc9+l/OZGhWvwOxh1emZLBJmU7+O1iHXk1l/LW413lg01t/KvRgLAjl1xkSWWeUpXe2kLVI/0qyuhy3BSJhfuMwAPE8vj0jlQQ5bYbRejJ5JXmMjB1GPtQfgLw+NueiHGXylvMko6pFqOm+fSMQ6LyVphxXy8favOb+bz+7hgCVpmW6rm0PCAros1mmWevkUhVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5dHJGc4dpevGs4JiJbhQ3HxJmU7+O1iHXk1l/LW413lh0R9VcNkmiK0129HLxA+XpLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
end

return TestsSessionsDoBasicCommunicationTCP