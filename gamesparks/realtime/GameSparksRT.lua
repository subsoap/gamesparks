GameSparksRT = {}

GameSparksRT.MAX_RTDATA_SLOTS = 128

GameSparksRT.MAX_UNRELIABLE_MESSAGE_SIZE_BYTES = 1400

GameSparksRT.logLevel = {DEBUG = 0, INFO = 1, WARN = 2, ERROR = 3}

GameSparksRT.connectState = {DISCONNECTED = 0, CONNECTING = 1, RELIABLE_ONLY = 2, RELIABLE_AND_FAST_SEND = 3, RELIABLE_AND_FAST = 4}

GameSparksRT.deliveryIntent = {RELIABLE = 0, UNRELIABLE = 1, UNRELIABLE_SEQUENCED = 2}

GameSparksRT.currLogLevel = GameSparksRT.logLevel.DEBUG
GameSparksRT.tagLevels = {}

GameSparksRT.retryBase = 2000
GameSparksRT.retryMax = 60000
GameSparksRT.handshakeOffset = 2000

function GameSparksRT.logger(msg)
  print(msg)
end

function GameSparksRT.getSession(connectToken, hostName, tcpPort, udpPort, listener)
  local RTSessionImpl = require("gamesparks.realtime.RTSessionImpl")
  
  return RTSessionImpl.new(connectToken, hostName, tcpPort, udpPort, listener)
end

function GameSparksRT.setRootLogLevel(level)
  GameSparksRT.currLogLevel = level
end

function GameSparksRT.setLogLevel(tag, level)
  GameSparksRT.tagLevels[tag] = level
end

function GameSparksRT.shouldLog(tag, level)
  for key, value in pairs(GameSparksRT.tagLevels) do
    if key == tag then 
      return GameSparksRT.tagLevels[tag] >= level
    end
  end
  
  return GameSparksRT.currLogLevel <= level
end

function GameSparksRT.computeSleepPeriod(attempt)
  return math.random(0, math.min(GameSparksRT.retryMax, GameSparksRT.retryBase * 2 ^ attempt))
end

return GameSparksRT
