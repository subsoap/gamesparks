OpCodes = OpCodes or require("gamesparks.realtime.commands.OpCodes")
ProtocolParser = ProtocolParser or require("gamesparks.realtime.proto.ProtocolParser")
PooledObjects = PooledObjects or require("gamesparks.realtime.pools.PooledObjects")
LimitedPositionStream = LimitedPositionStream or require("gamesparks.realtime.proto.LimitedPositionStream")
CustomCommand = CustomCommand or require("gamesparks.realtime.commands.CustomCommand")
LoginResult = LoginResult or require("gamesparks.realtime.commands.results.LoginResult")
PingResult = PingResult or require("gamesparks.realtime.commands.results.PingResult")
PlayerConnectMessage = PlayerConnectMessage or require("gamesparks.realtime.commands.results.PlayerConnectMessage")
UDPConnectMessage = UDPConnectMessage or require("gamesparks.realtime.commands.results.UDPConnectMessage")
PlayerDisconnectMessage = PlayerDisconnectMessage or require("gamesparks.realtime.commands.results.PlayerDisconnectMessage")

CommandFactory = {}

function CommandFactory.getCommand(opCode, sender, sequence, stream, session, data, packetSize)
  local ret = nil
  local limit = ProtocolParser.readUInt32(stream)
  local lps = PooledObjects.limitedPositionStreamPool:pop()
  
  --print(session.peerId,opCode)
  
  lps:wrap(stream, limit)
  
  if opCode == OpCodes.LOGIN_RESULT then
    ret = LoginResult.deserialize(lps, LoginResult.pool:pop())
  elseif opCode == OpCodes.PING_RESULT then
    ret = PingResult.deserialize(lps, PingResult.pool:pop())
  elseif opCode == OpCodes.UDP_CONNECT_MESSAGE then
    ret = UDPConnectMessage.deserialize(lps, UDPConnectMessage.pool:pop())
  elseif opCode == OpCodes.PLAYER_CONNECT_MESSAGE then
    ret = PlayerConnectMessage.deserialize(lps, PlayerConnectMessage.pool:pop())
  elseif opCode == OpCodes.PLAYER_DISCONNECT_MESSAGE then
    ret = PlayerDisconnectMessage.deserialize(lps, PlayerDisconnectMessage.pool:pop())
  else
    if session:shouldExecute(sender, sequence) then
      ret = CustomCommand.pool:pop():configure(opCode, sender, lps, data, limit, session, packetSize)
    end
  end
  
  lps:skipToEnd()
        
  PooledObjects.limitedPositionStreamPool:push(lps)
  
  return ret
end

return CommandFactory
