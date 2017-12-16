local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestSessionsDontBecomeReadyIfNotStarted = {}
local TestSessionsDontBecomeReadyIfNotStarted_mt = {__index = TestSessionsDontBecomeReadyIfNotStarted}

TestSessionsDontBecomeReadyIfNotStarted.mFinished = false

local writeText = nil

function TestSessionsDontBecomeReadyIfNotStarted.new()
  local instance = TestBase.new()
  
  instance.ctx = nil

  return setmetatable(instance, TestSessionsDontBecomeReadyIfNotStarted_mt)
end

setmetatable(TestSessionsDontBecomeReadyIfNotStarted, {__index = TestBase})

function TestSessionsDontBecomeReadyIfNotStarted:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestSessionsDontBecomeReadyIfNotStarted => ")
  
  print("##############################################")
  print("### TestSessionsDontBecomeReadyIfNotStarted###")
  print("##############################################")
  
  GameSparksRT.setRootLogLevel(GameSparksRT.logLevel.DEBUG)
  
  self.ctx = self:getTestContext(4, false, nil,
  {"tG63UiCGK3oDFm/JuC+AAf2xDhpJJVCzmbPeniUbY56AmGlbSeKdIJK1SM+VjXevHWwVwgBVv88aVXUtTVWk+GjOYJO48k/baoHpw5RQe0XmoGLSSPWVijcCRNxjZGngiImJwFZs0chYBaF5ICay2yVphxXy8favOb+bz+7hgCVA0kzynuFvQfU+S+CWw2vghVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5fJ9y1QIwPErCOBTd284LH/2xDhpJJVCzmbPeniUbY569KHAWLCRXgXVybFEeQTWFLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "Ej4LxTBO1kq8SlKz9JPUif2xDhpJJVCzmbPeniUbY56AmGlbSeKdIJK1SM+VjXevHWwVwgBVv88aVXUtTVWk+BaPcogMELGDua8SrUqpdn/moGLSSPWVijcCRNxjZGngiImJwFZs0chYBaF5ICay2yVphxXy8favOb+bz+7hgCWnjIQFLW2GUmtO/HOWw9T/hVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5fJ9y1QIwPErCOBTd284LH/2xDhpJJVCzmbPeniUbY569KHAWLCRXgXVybFEeQTWFLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "ZX1yERQXnA4wIVOwtwxr4v2xDhpJJVCzmbPeniUbY56AmGlbSeKdIJK1SM+VjXevHWwVwgBVv88aVXUtTVWk+CanzlW3uAqck8Ivc74NMLHmoGLSSPWVijcCRNxjZGngiImJwFZs0chYBaF5ICay2yVphxXy8favOb+bz+7hgCU2CAf0rR1MwIVhUvsjF36xhVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5fJ9y1QIwPErCOBTd284LH/2xDhpJJVCzmbPeniUbY569KHAWLCRXgXVybFEeQTWFLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P",
  "aCLtC6xNZz/CipfsPletC/2xDhpJJVCzmbPeniUbY56AmGlbSeKdIJK1SM+VjXevHWwVwgBVv88aVXUtTVWk+MwAPE8vj0jlQQ5bYbRejJ7moGLSSPWVijcCRNxjZGngiImJwFZs0chYBaF5ICay2yVphxXy8favOb+bz+7hgCVpmW6rm0PCAros1mmWevkUhVvB+SA2iWgbCtMycJCAVy0caGnWZ9PgqsY6kmhwFuBp5Fcu8pqtmpI0ZcaOEBV5fJ9y1QIwPErCOBTd284LH/2xDhpJJVCzmbPeniUbY569KHAWLCRXgXVybFEeQTWFLl4c4CP6Dr6ZgR6lWiZ5cgfvUZRXAEKpp3TMOiXbrCNyZTNUzBIGgBy6aM256C7P"})
  
  local cdl = CountdownLatch.new(3)
  
  for i = 1, 4 do
    self.ctx.sessions[i].onReadyCB = function(ready)
      if ready then
        cdl:signal()
      end
    end
  end
  
  cdl:wait(5, function(timedout)
    assert(timedout, "Did became ready.")
    
    writeText("PASSED!\n")
    
    TestSessionsDontBecomeReadyIfNotStarted.mFinished = true
  end)
end

return TestSessionsDontBecomeReadyIfNotStarted