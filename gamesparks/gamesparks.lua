local lib = {}

local GS = require("gamesparks.GS")
local GSRT = require("gamesparks.realtime.GameSparksRT")
local GSRTData = require("gamesparks.realtime.RTData")

local gs = createGS()

lib.setAvailabilityCallback = function(value)
  gs.setAvailabilityCallback(value)
end

lib.setAuthenticatedCallback = function(value)
  gs.setAuthenticatedCallback(value)
end

lib.setMessageHandlerCallback = function(value)
  gs.setMessageHandlerCallback(value)
end

lib.setUseLiveServices = function(value)
  gs.setUseLiveServices(value)
end

lib.setApiSecret = function(value)
  gs.setApiSecret(value)
end

lib.setApiKey = function(value)
  gs.setApiKey(value)
end

lib.setApiCredential = function(value)
  gs.setApiCredential(value)
end

lib.setLogger = function(value)
  gs.setLogger(value)
end

lib.connect = function()
  gs.connect()
end

lib.send = function(request)
  gs.send(request)
end

lib.disconnect = function()
  gs.disconnect(true)
end

lib.getRequestBuilder = function()
  return gs.getRequestBuilder()
end

lib.getMessageHandler = function()
  return gs.getMessageHandler()
end

lib.getDeviceStats = function()
	return gs.getDeviceStats()
end

lib.isAvailable = function()
	return gs.isAvailable()
end

lib.isAuthenticated = function()
	return gs.isAuthenticated()
end

lib.getRealTimeServices = function()
  return GSRT
end

lib.getRTData = function()
  return GSRTData
end

return lib
