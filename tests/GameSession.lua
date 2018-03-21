local gs = require("gamesparks.gamesparks")
local gsrt = gs.getRealTimeServices()

local GameSession = {}
local GameSession_mt = {__index = GameSession}

function GameSession.new(connectToken, host, port)
  local instance = {}
  
  instance.ready = false
  instance.onPlayerConnectCB = nil
  instance.onPlayerDisconnectCB = nil
  instance.onReadyCB = nil
  instance.onPacketCB = nil
  
  local index = string.find(host, ":")
  local theHost
      
  if index then
    theHost = string.sub(host, 1, index - 1)
  else
    theHost = host
  end
  
  print(theHost .. " : " .. port)
  
  instance.session = gsrt.getSession(connectToken, theHost, port, port, instance)
  if instance.session ~= nil then
    instance.session:start()
  end
  
  return setmetatable(instance, GameSession_mt)
end

function GameSession:stop()
  self.ready = false
  if self.session ~= nil then
    self.session:stop()
    self.session = nil
  end
end

function GameSession:log(message)
  local peers = "|"
  
  for _,v in ipairs(self.session.activePeers) do 
    peers = peers .. v .. "|"
  end
          
  print(self.session.peerId .. ": " .. message .. " peers:" .. peers)
end

function GameSession:onPlayerConnect(peerId)
  self:log(" OnPlayerConnect:" .. peerId)
  
  if self.onPlayerConnectCB ~= nil then
    self.onPlayerConnectCB(peerId)
  end
end

function GameSession:onPlayerDisconnect(peerId)
  self:log(" OnPlayerDisconnect:" .. peerId)

  self.ready = false
  
  if self.onPlayerDisconnectCB ~= nil then
    self.onPlayerDisconnectCB(peerId)
  end
end

function GameSession:onReady(ready)
  self:log(" OnReady:" .. tostring(ready))

  self.ready = ready
  
  if self.onReadyCB ~= nil then
    self.onReadyCB(ready)
  end
end

function GameSession:onPacket(packet)
  self:log(" OnPacket:" .. packet:toString())

  if self.onPacketCB ~= nil then
    self.onPacketCB(packet)
  end
end

return GameSession
