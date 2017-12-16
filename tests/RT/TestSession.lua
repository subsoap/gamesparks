local gs = require("gamesparks.gamesparks")
local gsrt = gs.getRealTimeServices()

local TestSession = {}
local TestSession_mt = {__index = TestSession}

function TestSession.new(connectToken, host, port, name)
  local instance = {}
  
  instance.name = name
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
  
  return setmetatable(instance, TestSession_mt)
end

function TestSession:start()
  if self.session ~= nil then
    self.session:start()
  end
end

function TestSession:stop()
  if self.session ~= nil then
    self.session:stop()
  end
end

function TestSession:log(message)
  local peers = "|"
  
  for _,v in ipairs(self.session.activePeers) do 
    peers = peers .. v .. "|"
  end
          
  print(self.session.peerId .. ":" .. self.name .. " " .. message .. " peers:" .. peers)
end

function TestSession:onPlayerConnect(peerId)
  self:log(" OnPlayerConnect:" .. peerId)
  
  if self.onPlayerConnectCB ~= nil then
    self.onPlayerConnectCB(peerId)
  end
end

function TestSession:onPlayerDisconnect(peerId)
  self:log(" OnPlayerDisconnect:" .. peerId)
  
  if self.onPlayerDisconnectCB ~= nil then
    self.onPlayerDisconnectCB(peerId)
  end
end

function TestSession:onReady(ready)
  self:log(" OnReady:" .. tostring(ready))
  
  if self.onReadyCB ~= nil then
    self.onReadyCB(ready)
  end
end

function TestSession:onPacket(packet)
  self:log(" OnPacket:" .. packet:toString())

  if self.onPacketCB ~= nil then
    self.onPacketCB(packet)
  end
end

return TestSession