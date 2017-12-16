AutoResetEvent = {}

function AutoResetEvent.new(initialState)
  return {state = initialState, startTime = 0, myTimer = nil, timeout = 0, callback = nil}
end

function AutoResetEvent.set(autoResetEvent)
  autoResetEvent.state = true
end

function AutoResetEvent.waitOne(autoResetEvent, timeout, callback)
  autoResetEvent.timeout = timeout
  autoResetEvent.callback = callback
  
  autoResetEvent.startTime = os.time()
  
  autoResetEvent.myTimer = timer.repeating(0.1, function() AutoResetEvent.checkSet(autoResetEvent) end)
end

function AutoResetEvent.checkSet(autoResetEvent)
  if os.time() - autoResetEvent.startTime < autoResetEvent.timeout then
    if autoResetEvent.state then
      autoResetEvent.state = false
      
      timer.cancel(autoResetEvent.myTimer)
      autoResetEvent.myTimer = nil
      
      autoResetEvent.callback(false)
    end
  else
    timer.cancel(autoResetEvent.myTimer)
    autoResetEvent.myTimer = nil
    
    autoResetEvent.callback(true)
  end
end

return AutoResetEvent