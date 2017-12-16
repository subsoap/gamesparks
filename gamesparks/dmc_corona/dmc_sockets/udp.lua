local VERSION = "0.0.1"



--====================================================================--
--== Imports


local Objects = require 'gamesparks.dmc_corona.lib.dmc_lua.lua_objects'
local socket = require 'builtins.scripts.socket'
local Utils = require 'gamesparks.dmc_corona.lib.dmc_lua.lua_utils'



--====================================================================--
--== Setup, Constants


local ObjectBase = Objects.ObjectBase

local sfind = string.find
local ssub = string.sub
local tconcat = table.concat
local type = type

local LOCAL_DEBUG = false


--====================================================================--
--== UDP Socket Class
--====================================================================--


local UDPSocket = newClass( ObjectBase, { name="UDP Socket" } )

--== Class Constants

-- Connection-Status Constants

UDPSocket.NO_SOCKET = 'no_socket'
UDPSocket.NOT_CONNECTED = 'socket_not_connected'
UDPSocket.CONNECTED = 'socket_connected'
UDPSocket.CLOSED = 'socket_closed'

-- Lua Socket Error Msg Constants

UDPSocket.ERR_CONNECTED = 'already connected'
UDPSocket.ERR_CONNECTION = 'Operation already in progress'
UDPSocket.ERR_TIMEOUT = 'timeout'
UDPSocket.SSL_READTIMEOUT = 'wantread'
UDPSocket.ERR_CLOSED = 'already closed'

--== Event Constants

UDPSocket.EVENT = 'udp_socket_event'

UDPSocket.CONNECT = 'connect_event'
UDPSocket.READ = 'read_event'
UDPSocket.WRITE = 'write_event'


--======================================================--
-- Start: Setup Lua Objects

function UDPSocket:__init__( params )
	-- print( "UDPSocket:__init__" )
	params = params or {}
	self:superCall( '__init__', params )
	--==--

	if self.is_class then return end

	assert( params.master, "UDP Socket requires Master")

	--== Create Properties ==--

	self._host = nil
	self._port = nil
	self._ip = nil
	self._size = nil     -- size of the datagram
	
	self._status = nil
	self._buffer = "" -- string

	self.secure = false

	--== Object References ==--

	self._socket = nil -- real Lua Socket
	self._master = params.master

end


function UDPSocket:__undoInitComplete__()
	-- print( "UDPSocket:__undoInitComplete__" )

	self:_removeSocket()

	--==--
	self:superCall( '__undoInitComplete__' )
end

-- END: Setup Lua Objects
--======================================================--



--====================================================================--
--== Public Methods


function UDPSocket.__getters:status()
	return self._status
end

function UDPSocket.__getters:buffer_size()
	return #self._buffer
end

function UDPSocket:clearBuffer()
	-- print( 'UDPSocket:clearBuffer' )
	self._buffer = ""
end


function UDPSocket:connect( host, port, params )
	-- print( 'UDPSocket:connect', host, port, params )
	params = params or {}
	--==--

	self._host = host
	self._port = port

	local evt = {}

	if self._status == UDPSocket.CONNECTED then

		evt.status = self._status
		evt.emsg = self.ERR_CONNECTED

		-- warning( evt.emsg ) -- waiting for dmc_patch
		-- print( "UDPSocket:connect:: " .. evt.emsg )

		self:dispatchEvent( self.CONNECT, evt, { merge=true } )
		return
	end
	
	local success, emsg = socket.dns.toip(self._host)
	if LOCAL_DEBUG then
    print( "ip ", success, emsg )
  end
  
  self._ip = success

	success, emsg = self:_createSocket(params)
	if LOCAL_DEBUG then
    print( "created socket ", success, emsg )
  end
  
  success, emsg = self._socket:setpeername(self._ip, self._port)
  if LOCAL_DEBUG then
    print( "setpeername ", success, emsg )
  end

	if success then
		self._status = UDPSocket.CONNECTED
		--self._socket:settimeout(0)

		self._master:_connect( self )

		evt.status = self._status
		evt.emsg = nil

		self:dispatchEvent( self.CONNECT, evt, { merge=true } )

	else
		self._status = UDPSocket.NOT_CONNECTED

		evt.status = self._status
		evt.emsg = nil

		self:dispatchEvent( self.CONNECT, evt, { merge=true } )

	end

end


function UDPSocket:getLocalHostName()
  local host, port = self._socket:getsockname()
  
  return host .. ":" .. port
end


function UDPSocket:send( data )
	-- print( 'UDPSocket:send', #data )
	if LOCAL_DEBUG then
		Utils.hexDump( data )
	end
	
	local ret, emsg = self._socket:send( data )

  if ret then
    return true, ""
  else
    return false, emsg
  end
end


function UDPSocket:unreceive( data )
	-- print( 'UDPSocket:unreceive', #data )
	self._buffer = tconcat( { data, self._buffer } )
end

function UDPSocket:receive()
	-- print( 'UDPSocket:receive' )

	local buffer = self._buffer

	local data

  data = buffer
	self._buffer = ""

	return data
end


function UDPSocket:close()
	-- print( 'UDPSocket:close' )

	local evt = {}

	if self._status == UDPSocket.CLOSED then
		evt.status = self._status
		evt.emsg = self.ERR_CLOSED

		-- notice( evt.emsg ) -- waiting for dmc_patch
		-- print( "UDPSocket:close :" .. evt.emsg )

		-- self:dispatchEvent( self.CONNECT, evt, { merge=true } )

		return
	end

	self:_closeSocket()
	self:_removeSocket()

end



--====================================================================--
--== Private Methods


function UDPSocket:_createSocket( params )
  local emsg
  
	-- print( 'UDPSocket:_createSocket' )
	params = params or {}
	--==--
	-- we already have unused socket available
	if self._status == UDPSocket.NOT_CONNECTED then return end

	self:_removeSocket()

	self._socket, emsg = socket.udp()
	self._status = UDPSocket.NOT_CONNECTED

  if self._socket then
    self._socket:settimeout( params.timeout )
    
    self._size = params.size
    
    return true, ""
  else
    return false, emsg
  end
end


function UDPSocket:_closeSocket()
	-- print( 'UDPSocket:_closeSocket' )

	local evt = {}

	self._socket:close()
	self._status = UDPSocket.CLOSED

	evt.status = self._status
	evt.emsg = nil

	self:_closeSocketDispatch( evt )

end


function UDPSocket:_closeSocketDispatch( evt )
	-- print( 'UDPSocket:_closeSocketDispatch', evt )
	self:dispatchEvent( self.CONNECT, evt, { merge=true } )
end


function UDPSocket:_removeSocket()
	-- print( 'UDPSocket:_removeSocket' )

	if not self._socket then return end

	self._master:_disconnect( self )

	self._socket = nil
	self._status = UDPSocket.NO_SOCKET

end


function UDPSocket:_readStatus( status )
	-- print( 'UDPSocket:_readStatus', status )

	local buff_tmp, buff_len

	local bytes, status = self._socket:receive( self._size )
	if LOCAL_DEBUG then
		print( 'UDP:dataReady', bytes, status )
	end

	if bytes ~= nil then
		buff_tmp = { self._buffer, bytes }
	end

	if buff_tmp then
		self._buffer = tconcat( buff_tmp )
	end

	if LOCAL_DEBUG then
		Utils.hexDump( self._buffer )
	end

	self:_doAfterReadAction()

end


function UDPSocket:_doAfterReadAction()
	-- print( 'UDPSocket:_doAfterReadAction' )
	local buff_len = #self._buffer
	if buff_len > 0 then
		local evt = {
			status = self._status,
			bytes = buff_len
		}
		self:dispatchEvent( self.READ, evt, { merge=true } )
	end
end


function UDPSocket:_writeStatus( status )
	print( 'UDPSocket:_writeStatus', status )

	-- TODO: hook up write notification
	-- this is likely to be different than the read
end



--====================================================================--
--== Event Handlers


-- none




return UDPSocket
