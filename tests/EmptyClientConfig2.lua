local GSHelperMethods = require("tests.GSHelperMethods")
local AutoResetEvent = require("tests.AutoResetEvent")

EmptyClientConfig2 = {}
EmptyClientConfig2.mFinished = false

local writeText = nil

local function part2(timedout)
  assert(not timedout, "GS was never available.")

  local instance = GSHelperMethods.getInstance("EMPTY_CLIENT_CONFIG2")

  assert(GSHelperMethods.DEFAULT_RETRY_BASE == instance.getRetryBase())
  assert(GSHelperMethods.DEFAULT_RETRY_MAX == instance.getRetryMax())
  assert(GSHelperMethods.DEFAULT_REQUEST_TIMEOUT == instance.getRequestTimeout())
  assert(GSHelperMethods.DEFAULT_DURABLE_CONCURRENT_REQUESTS == instance.getDurableConcurrentRequests())
  assert(GSHelperMethods.DEFAULT_DURABLE_DRAIN_INTERVAL == instance.getDurableDrainInterval())
  assert(GSHelperMethods.DEFAULT_HANDSHAKE_OFFSET == instance.getHandshakeOffset())

  GSHelperMethods.forceDisconnectionInstances()

  writeText("PASSED!\n")
  
  EmptyClientConfig2.mFinished = true
end

function EmptyClientConfig2:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("EmptyClientConfig2 => ")
  
  print("##############################################")
  print("### EmptyClientConfig2                     ###")
  print("##############################################")
  
  local availEvent = AutoResetEvent.new(false)
  local instance = GSHelperMethods.createInstance("EMPTY_CLIENT_CONFIG2")

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

  instance.setRetryBase(10000)
  instance.setRetryMax(20000)
  instance.setRequestTimeout(30000)
  instance.setDurableConcurrentRequests(40000)
  instance.setDurableDrainInterval(50000)
  instance.setHandshakeOffset(60000)

  assert(10000 == instance.getRetryBase())
  assert(20000 == instance.getRetryMax())
  assert(30000 == instance.getRequestTimeout())
  assert(40000 == instance.getDurableConcurrentRequests())
  assert(50000 == instance.getDurableDrainInterval())
  assert(60000 == instance.getHandshakeOffset())

  AutoResetEvent.waitOne(availEvent, GSHelperMethods.REQUEST_TIMEOUT, part2)
end

return EmptyClientConfig2