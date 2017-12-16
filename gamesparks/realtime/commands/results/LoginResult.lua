--GameSparksRT = GameSparksRT or require("gamesparks.realtime.GameSparksRT")
AbstractResult = AbstractResult or require("gamesparks.realtime.commands.results.AbstractResult")
ObjectPool = ObjectPool or require("gamesparks.realtime.pools.ObjectPool")
ProtocolParser = ProtocolParser or require("gamesparks.realtime.proto.ProtocolParser")
require("gamesparks.GSUtils")

local LoginResult = {}
local LoginResult_mt = {__index = LoginResult}
    
LoginResult.pool = ObjectPool.new(function()
  return LoginResult.new()
end, function(instance)
  instance.activePeers = {}
  instance.fastPort = nil
  instance.reconnectToken = nil
  instance.peerId = nil
end, 5)

function LoginResult.new()
  local instance = AbstractResult.new()
  
  instance.success = false
  instance.reconnectToken = nil
  instance.peerId = nil
  instance.activePeers = {}
  instance.fastPort = nil
  
  return setmetatable(instance, LoginResult_mt)
end

setmetatable(LoginResult, {__index = AbstractResult})

function LoginResult:execute()
  self.session.connectToken = self.reconnectToken
  self.session.peerId = self.peerId

  if self.packet.reliable == nil or self.packet.reliable == true then
    if self.fastPort ~= nil and self.fastPort then
      self.session.fastPort = self.fastPort
    end

    self.session.activePeers = {}
    self.session.activePeers = table.copy(self.activePeers)
    self.session:setConnectState(GameSparksRT.connectState.RELIABLE_ONLY)
    self.session:connectFast()
    self.session:log("LoginResult", GameSparksRT.logLevel.DEBUG, self.session.peerId .. " TCP LoginResult, ActivePeers " .. table.getn(self.session.activePeers) .. " FastPort " .. self.session.fastPort)
  else
    self.session:setConnectState(GameSparksRT.connectState.RELIABLE_AND_FAST_SEND)
    self.session:log("LoginResult", GameSparksRT.logLevel.DEBUG, self.session.peerId .. " UDP LoginResult, ActivePeers " .. table.getn(self.session.activePeers))
  end
  
  LoginResult.pool:push(self)
end

function LoginResult:executeAsync()
  return false
end

function LoginResult.deserialize(stream, instance)
  if instance.activePeers == nil then
    instance.activePeers = {}
  end
  
  while true do
    local keyByte = stream:readByte()
    
    if keyByte == -1 then
      break
    end
    
    local continue = false
    
    if keyByte == 8 then
      instance.success = ProtocolParser.readBool(stream)
      
      continue = true
    elseif keyByte == 18 then
      instance.reconnectToken = ProtocolParser.readString(stream)
      
      continue = true
    elseif keyByte == 24 then
      instance.peerId = ProtocolParser.readUInt64(stream)
      
      continue = true
    elseif keyByte == 32 then
      table.insert(instance.activePeers, ProtocolParser.readUInt64(stream))
      
      continue = true
    elseif keyByte == 40 then
      instance.fastPort = ProtocolParser.readUInt64(stream)
      
      continue = true
    end

    if not continue then
      local key = ProtocolParser.readKey(keyByte, stream)

      if key.field == 0 then
        print("WARNING: " .. "Invalid field id: 0, something went wrong in the stream")
        
        return nil
      else
        ProtocolParser.skipKey(stream, key)
      end
    end
  end

  return instance
end

return LoginResult
  