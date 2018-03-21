local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

EmptyClientConfig = {}
EmptyClientConfig.mFinished = false

local writeText = nil

local function part2(timedout)
  assert(not timedout, "GS was never available.")

  GSHelperMethods.forceDisconnectionInstances()

  writeText("PASSED!\n")
  
  EmptyClientConfig.mFinished = true
end

function EmptyClientConfig:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("EmptyClientConfig => ")
  
  print("##############################################")
  print("### EmptyClientConfig                      ###")
  print("##############################################")
  
  local availEvent = AutoResetEvent.new(false)
  local instance = GSHelperMethods.createInstance("EMPTY_CLIENT_CONFIG")

  instance.setCustomServiceUrl("ws://127.0.0.1:50000")
  instance.setLogger(function(text) print(text) end)
  instance.setApiSecret("XXX")
  instance.setApiKey("EMPTY_CLIENT_CONFIG")
  instance.setUseLiveServices(false)

  instance.setAvailabilityCallback(function(isAvailable)
    if isAvailable then
      AutoResetEvent.set(availEvent)
    end
  end)

  instance.connect()

  instance.setRetryBase(-1)
  instance.setRetryMax(-20)
  instance.setRequestTimeout(0)
  instance.setDurableConcurrentRequests(0)
  instance.setDurableDrainInterval(-400)
  instance.setHandshakeOffset(0)

  assert(GSHelperMethods.DEFAULT_RETRY_BASE == instance.getRetryBase())
  assert(GSHelperMethods.DEFAULT_RETRY_MAX == instance.getRetryMax())
  assert(GSHelperMethods.DEFAULT_REQUEST_TIMEOUT == instance.getRequestTimeout())
  assert(GSHelperMethods.DEFAULT_DURABLE_CONCURRENT_REQUESTS == instance.getDurableConcurrentRequests())
  assert(GSHelperMethods.DEFAULT_DURABLE_DRAIN_INTERVAL == instance.getDurableDrainInterval())
  assert(GSHelperMethods.DEFAULT_HANDSHAKE_OFFSET == instance.getHandshakeOffset())

  AutoResetEvent.waitOne(availEvent, GSHelperMethods.REQUEST_TIMEOUT, part2)
end

return EmptyClientConfig