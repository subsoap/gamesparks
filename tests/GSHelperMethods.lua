local gs = require("gamesparks.gamesparks")
local AutoResetEvent = require("tests.AutoResetEvent")

GSHelperMethods = {}

GSHelperMethods.REQUEST_TIMEOUT = 60

GSHelperMethods.RUN_FOR = 120
GSHelperMethods.CONCURRENT_CLIENTS = 10

GSHelperMethods.DEFAULT_RETRY_BASE = 2000
GSHelperMethods.DEFAULT_RETRY_MAX = 60000
GSHelperMethods.DEFAULT_REQUEST_TIMEOUT = 15000
GSHelperMethods.DEFAULT_DURABLE_CONCURRENT_REQUESTS = 1
GSHelperMethods.DEFAULT_DURABLE_DRAIN_INTERVAL = 100
GSHelperMethods.DEFAULT_HANDSHAKE_OFFSET = 2000
    
GSHelperMethods.userId = ""

GSHelperMethods.resultRetries = ""
    
GSHelperMethods.gsInstances = {}
GSHelperMethods.gsTempInstances = nil
GSHelperMethods.callback = nil
GSHelperMethods.callback2 = nil

GSHelperMethods.numRequests = 0

function GSHelperMethods.createInstance(name)
  local instance = GSHelperMethods.getInstance(name)
  
  if instance ~= nil then
    instance.disconnect(true)
  else
    instance = createGS(name)
        
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
  end)
  
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


function GSHelperMethods.sendControlMessage(message, callback)
	local gotResultEvent = AutoResetEvent.new(false)
	local instance = GSHelperMethods.createInstance(message)

	instance.setCustomServiceUrl("ws://127.0.0.1:50000")
	instance.setLogger(function(text) print(text) end)
	instance.setApiSecret("XXX")
	instance.setApiKey("CONTROL")
	instance.setUseLiveServices(false)

	print("Sending Control Message '" .. message .. "'...")

	instance.setAvailabilityCallback(function(isAvailable)
		if isAvailable then
			instance.setAvailabilityCallback(nil)

			local request = instance.getRequestBuilder().createAuthenticationRequest()
			request:setUserName(message)
			request:send(function(resp)
				if resp:hasErrors() then
					assert(false)
				else
					GSHelperMethods.resultRetries = resp:getDisplayName()

					print(GSHelperMethods.resultRetries)

					if #GSHelperMethods.resultRetries > 0 then
						AutoResetEvent.set(gotResultEvent)

						print("Got Control message result.")
					else
						assert(false)
					end
				end
			end)
		else
			assert(false)
		end
	end)

	GSHelperMethods.resultRetries = ""

	instance.connect()

	GSHelperMethods.callback = callback

	AutoResetEvent.waitOne(gotResultEvent, GSHelperMethods.REQUEST_TIMEOUT, GSHelperMethods.sendControlMessagePart2)

	return instance
end

function GSHelperMethods.setFuncAvailable(instance, action)
	instance.setAvailabilityCallback(function(isAvailable)
		if isAvailable then
			instance.setAvailabilityCallback(nil)

			local request = instance.getRequestBuilder().createAuthenticationRequest()

			request:send(nil)

			if action ~= nil then
				action()
			end
		else
			assert(false)
		end
	end)
end

function GSHelperMethods.connectTest(testMethod, callback)
	GSHelperMethods.sendControlMessage("RESET", function()
		local instances = {}

		for i = 1, GSHelperMethods.CONCURRENT_CLIENTS do
			instances[i] = GSHelperMethods.createInstance(testMethod .. i)

			instances[i].setCustomServiceUrl("ws://127.0.0.1:50000")
			instances[i].setLogger(function(text) print(text) end)
			instances[i].setApiSecret("XXX")
			instances[i].setApiKey(testMethod)
			instances[i].setUseLiveServices(false)

			GSHelperMethods.setFuncAvailable(instances[i], nil)

			instances[i].connect()
		end

		timer.seconds(GSHelperMethods.RUN_FOR, function()
			GSHelperMethods.forceDisconnectionInstances()

			GSHelperMethods.sendControlMessage("GET_REPORT", function()
				timer.seconds(1.0, function() 
					GSHelperMethods.forceDisconnectionInstances()

					callback()
				end)
			end)
		end)
	end)
end

function GSHelperMethods.deliverTest(endpoint, numRequests, callback)
	GSHelperMethods.gsTempInstances = {}

	GSHelperMethods.callback2 = callback

	GSHelperMethods.numRequests = numRequests

	GSHelperMethods.sendControlMessage("RESET", function()
		local allAvailable = 0
		local availEvent = AutoResetEvent.new(false)

		for i = 1, GSHelperMethods.CONCURRENT_CLIENTS do
			GSHelperMethods.gsTempInstances[i] = GSHelperMethods.createInstance(endpoint .. i)

			GSHelperMethods.gsTempInstances[i].setCustomServiceUrl("ws://127.0.0.1:50000")
			GSHelperMethods.gsTempInstances[i].setLogger(function(text) print(text) end)
			GSHelperMethods.gsTempInstances[i].setApiSecret("XXX")
			GSHelperMethods.gsTempInstances[i].setApiKey(endpoint)
			GSHelperMethods.gsTempInstances[i].setUseLiveServices(false)
			GSHelperMethods.gsTempInstances[i].clearDurableQueue()

			GSHelperMethods.setFuncAvailable(GSHelperMethods.gsTempInstances[i], function()
				allAvailable = allAvailable + 1
				if allAvailable >= GSHelperMethods.CONCURRENT_CLIENTS then
					AutoResetEvent.set(availEvent)
				end
			end)

			GSHelperMethods.gsTempInstances[i].connect()
		end

		AutoResetEvent.waitOne(availEvent, GSHelperMethods.REQUEST_TIMEOUT, GSHelperMethods.deliverTestPart2)
	end)
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

function GSHelperMethods.forceDisconnectionInstances()
  for key, gs in pairs(GSHelperMethods.gsInstances) do
    if gs ~= nil then
      GSHelperMethods.disconnectInstance(gs)
      
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
  end)
  
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

function GSHelperMethods.sendControlMessagePart2(timedout)
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

function GSHelperMethods.deliverTestPart2(timedout)
  assert(not timedout, "Timeout. GameSparks not available.")
  
  for a = 1, #GSHelperMethods.gsTempInstances do
    local authRequest = GSHelperMethods.gsTempInstances[a].getRequestBuilder().createDeviceAuthenticationRequest()

    authRequest:setDurable(true)

    for b = 1, GSHelperMethods.numRequests do
      authRequest:send(nil)
    end
  end

  timer.seconds(GSHelperMethods.RUN_FOR, function()
    GSHelperMethods.forceDisconnectionInstances()

    GSHelperMethods.sendControlMessage("GET_REPORT", GSHelperMethods.deliverTestPart3)
  end)
end

function GSHelperMethods.deliverTestPart3()
  timer.seconds(1.0, function() 
    GSHelperMethods.forceDisconnectionInstances()

    GSHelperMethods.callback2()
  end)
end

return GSHelperMethods
