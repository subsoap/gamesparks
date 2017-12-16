local gs = require("gamesparks.gamesparks")
local AutoResetEvent = require("tests.AutoResetEvent")

GSHelperMethods = {}

GSHelperMethods.REQUEST_TIMEOUT = 60
    
GSHelperMethods.userId = ""
    
GSHelperMethods.gsInstances = {}
GSHelperMethods.callback = nil

function GSHelperMethods.createInstance(name)
  local instance = GSHelperMethods.getInstance(name)
  
  if instance ~= nil then
    instance.disconnect(true)
  else
    instance = createGS()
        
    GSHelperMethods.gsInstances[name] = instance
  end
    
  return instance
end

function GSHelperMethods.createInstanceAndConnect(name)
  local instance = GSHelperMethods.createInstance(name)
  
  if instance ~= nil then
    GSHelperMethods.connectInstance(instance)
  end
  
  return instance
end

function GSHelperMethods.createDefaultInstance()
  return GSHelperMethods.createInstance("default")
end
    
function GSHelperMethods.connectDefaultInstance()
  GSHelperMethods.connectInstance(GSHelperMethods.getInstance("default"))
end
    
function GSHelperMethods.getInstance(name)
  return GSHelperMethods.gsInstances[name]
end
    
function GSHelperMethods.getDefaultInstance()
  return GSHelperMethods.getInstance("default")
end

function GSHelperMethods.createInstanceWaitForAvailable(name, callback)
  local gs = GSHelperMethods.createInstance(name)
  local ev = AutoResetEvent.new(false)
  
  assert(gs, "GameSparks instance null.")
  
  assert(not gs.isAvailable(), "GameSparks was available from the start.")
  
  gs.setAvailabilityCallback(function(isAvailable)
    if isAvailable then
      AutoResetEvent.set(ev)
    end
  end);
  
  GSHelperMethods.connectInstance(gs)
  
  GSHelperMethods.callback = callback
  
  AutoResetEvent.waitOne(ev, GSHelperMethods.REQUEST_TIMEOUT, GSHelperMethods.createInstanceWaitForAvailablePart2)
  
  return gs
end

function GSHelperMethods.createInstanceWaitForAuthenticated(name, callback)
  local gs = GSHelperMethods.createInstance(name)
  local ev = AutoResetEvent.new(false)
  
  assert(gs, "GameSparks instance null.")
  
  assert(not gs.isAvailable(), "GameSparks was available from the start.")
  
  gs.setAuthenticatedCallback(function(userId)
    if userId then
      AutoResetEvent.set(ev)
    end
  end)
  
  GSHelperMethods.connectInstance(gs)
  
  GSHelperMethods.callback = callback
  
  AutoResetEvent.waitOne(ev, GSHelperMethods.REQUEST_TIMEOUT, GSHelperMethods.createInstanceWaitForAuthenticatedPart2)
  
  return gs
end

function GSHelperMethods.waitForShutdownInstance(name, callback)
  local ev = AutoResetEvent.new(false)
  
  GSHelperMethods.callback = callback
  
  GSHelperMethods.shutDownInstance(name, function()
    timer.seconds(1.0, function() AutoResetEvent.set(ev) end)
  end)
  
  AutoResetEvent.waitOne(ev, GSHelperMethods.REQUEST_TIMEOUT, GSHelperMethods.waitForShutdownPart2)
end

function GSHelperMethods.waitForShutdown(gs, callback)
  timer.seconds(1.5, function()
    local ev = AutoResetEvent.new(false)
    
    GSHelperMethods.callback = callback
    
    GSHelperMethods.shutDown(gs, function()
      timer.seconds(1.0, function() AutoResetEvent.set(ev) end)
    end)
    
    AutoResetEvent.waitOne(ev, GSHelperMethods.REQUEST_TIMEOUT, GSHelperMethods.waitForShutdownPart2)
  end)
end

function GSHelperMethods.shutDownInstance(name, callback)
  local gs = GSHelperMethods.getInstance(name)
  
  gs.getRequestBuilder().createEndSessionRequest():send(function(response)
    GSHelperMethods.disconnectInstance(gs) 
    
    if callback ~= nil then
      timer.seconds(1.0, function() callback() end)
    end
  end)
  
  GSHelperMethods.gsInstances[name] = nil
end

function GSHelperMethods.shutDown(gs, callback)
  gs.getRequestBuilder().createEndSessionRequest():send(function(response)
    GSHelperMethods.disconnectInstance(gs)
   
    if callback ~= nil then
      timer.seconds(1.0, function() callback() end)
    end
  end)
end

function GSHelperMethods.shutDownAllInstances()
  for key, gs in pairs(GSHelperMethods.gsInstances) do
    if gs ~= nil then
      GSHelperMethods.shutDown(gs)
      
      GSHelperMethods.gsInstances[key] = nil
    end
  end
end

function GSHelperMethods.waitForDeviceAuthentication(gs, callback)
  local authenticatedEvent = AutoResetEvent.new(false)
  
  GSHelperMethods.callback = callback
  
  local request = gs.getRequestBuilder().createDeviceAuthenticationRequest()
  request:setDeviceId("12345")
  request:setDeviceOS("MacOS")
  request:send(function(resp)
    GSHelperMethods.userId = resp:getUserId()
    
    AutoResetEvent.set(authenticatedEvent)
    
    assert(gs.isAuthenticated())
  end);
  
  AutoResetEvent.waitOne(authenticatedEvent, GSHelperMethods.REQUEST_TIMEOUT, GSHelperMethods.waitForDeviceAuthenticationPart2);
end

function GSHelperMethods.getLogRequest(gs)
  local request = gs.getRequestBuilder().createLogEventRequest()
  
  request:setEventKey("testMessage")
  request:setAttribute("foo", "bar")
    
  return request
end

function GSHelperMethods.disconnectInstance(gs)
  gs.disconnect(true)
end

function GSHelperMethods.disconnectDefaultInstance()
  GSHelperMethods.disconnectInstance(GSHelperMethods.getInstance("default"))
end

function GSHelperMethods.connectInstance(instance)
  instance.setLogger(function(text) print(text) end)
  instance.setApiSecret("p5pFVnohi5eWPYETb4aPgeMLtd95bjfJ")
  instance.setApiKey("2974660weiMa")
  instance.setUseLiveServices(true)
  instance.connect()
end

function GSHelperMethods.createInstanceWaitForAvailablePart2(timedout)
  assert(not timedout, "Timeout. GameSparks not available.")
  
  GSHelperMethods.callback()
end

function GSHelperMethods.createInstanceWaitForAuthenticatedPart2(timedout)
  assert(not timedout, "Timeout. GameSparks not available.")
  
  GSHelperMethods.callback()
end

function GSHelperMethods.waitForShutdownPart2(timedout)
  assert(not timedout, "Timeout. Shutdown never completed.")
  
  GSHelperMethods.callback()
end

function GSHelperMethods.waitForDeviceAuthenticationPart2(timedout)
  assert(not timedout, "Did not authenticate.")
  
  GSHelperMethods.callback()
end

return GSHelperMethods