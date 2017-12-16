CountdownLatch = {}
CountdownLatch_mt = {__index = CountdownLatch}

function CountdownLatch.new(initialCount)
  local instance = {}
  
  instance.startTime = 0
  instance.myTimer = nil
  instance.timeout = 0
  instance.callback = nil
  instance.count = initialCount
  instance.complete = false
  
  return setmetatable(instance, CountdownLatch_mt)
end

function CountdownLatch:signal()
  if self.count > 0 then
    self.count = self.count - 1
    
    if self.count == 0 then
      self.complete = true
    end
  end
end

function CountdownLatch:isComplete()
  return self.complete
end

function CountdownLatch:wait(timeout, callback)
  self.timeout = timeout
  self.callback = callback
  
  self.startTime = os.time()
  
  self.myTimer = timer.repeating(0.1, function() self:timer() end)
end

function CountdownLatch:timer()
  if os.time() - self.startTime >= self.timeout and self.count > 0 then
    timer.cancel(self.myTimer)
    self.myTimer = nil
    
    self.callback(true)
  elseif self.count == 0 then
    timer.cancel(self.myTimer)
    self.myTimer = nil
      
    self.callback(false)
  end
end

return CountdownLatch