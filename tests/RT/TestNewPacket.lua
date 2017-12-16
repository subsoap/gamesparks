local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")

local TestNewPacket = {}
local TestNewPacket_mt = {__index = TestNewPacket}

TestNewPacket.mFinished = false

local writeText = nil

function TestNewPacket.new()
  local instance = TestBase.new()
  
  instance.ctx = nil
  
  return setmetatable(instance, TestNewPacket_mt)
end

setmetatable(TestNewPacket, {__index = TestBase})

function TestNewPacket:getScript()
  return "03_newPacket"
end

function TestNewPacket:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestNewPacket => ")
  
  print("##############################################")
  print("### TestNewPacket                          ###")
  print("##############################################")
  
  self.ctx = self:getTestContext(4, false, nil,
  {"X/wdyLmHeyjkCjNlscKVtnDwR8EdM9asPOS+1I7F5WBQijj5ILOsKKd1RZclD06lrRAqQpy33pyWuwnT20BQXWjOYJO48k/baoHpw5RQe0X6ab6ENS+DxSKfw9YrDZf54SJsnCPIEbO5e94ixzOZy9bXFpQwIr3vEAUo1tkIjHp555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzdZn9hhAb77Db8V/velEmIzVvc0Q39vwI5l5iEYQUCKM0pHWcwn3jR3DY5azLx4dkZtNhaaXDRLEWojCT8m2ak+Q==",
  "nZ67E3qpFDjEHgv7CsYu6XDwR8EdM9asPOS+1I7F5WBQijj5ILOsKKd1RZclD06lrRAqQpy33pyWuwnT20BQXRaPcogMELGDua8SrUqpdn/6ab6ENS+DxSKfw9YrDZf54SJsnCPIEbO5e94ixzOZy9bXFpQwIr3vEAUo1tkIjHp555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzdZn9hhAb77Db8V/velEmIzVvc0Q39vwI5l5iEYQUCKM0pHWcwn3jR3DY5azLx4dkZdG8opsro77RV9q/DMoBLrw==",
  "EWcE2hs/9GDBcIriJznT23DwR8EdM9asPOS+1I7F5WBQijj5ILOsKKd1RZclD06lrRAqQpy33pyWuwnT20BQXSanzlW3uAqck8Ivc74NMLH6ab6ENS+DxSKfw9YrDZf54SJsnCPIEbO5e94ixzOZy9bXFpQwIr3vEAUo1tkIjHp555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzdZn9hhAb77Db8V/velEmIzVvc0Q39vwI5l5iEYQUCKM0pHWcwn3jR3DY5azLx4dkZXlvgzqchImJ49i5rdzXJRQ==",
  "fxpSMHu/MV1bOF5l0W80NHDwR8EdM9asPOS+1I7F5WBQijj5ILOsKKd1RZclD06lrRAqQpy33pyWuwnT20BQXcwAPE8vj0jlQQ5bYbRejJ76ab6ENS+DxSKfw9YrDZf54SJsnCPIEbO5e94ixzOZy9bXFpQwIr3vEAUo1tkIjHp555xwsYmobbcw24mxWffcXFWOBciTOqFllDgpUYxHlesylob3k4LIVMsPOHbwEY9QS91mjzqapVB5I1Ry9DxR3dckWn+OddaN+jkTyYfFcxKCirCQ6+AGgI/meB9TwaeS3PFhQiYLIqIlgXreqmzdZn9hhAb77Db8V/velEmIzVvc0Q39vwI5l5iEYQUCKM0pHWcwn3jR3DY5azLx4dkZe/1753F9r0ryuU5oEB6kIg=="})
  
  local cdl = CountdownLatch.new(6)
  
  self.ctx.sessions[1].onPacketCB = function(packet)
    if packet.opCode == 301 then
      cdl:signal()
    else
      error(packet:toString())
    end
  end

  self.ctx.sessions[2].onPacketCB = function(packet)
    if packet.opCode == 301 then
      cdl:signal()
    else
      error(packet:toString())
    end
  end

  self.ctx.sessions[3].onPacketCB = function(packet)
    if packet.opCode == 301 then
      cdl:signal()
    elseif packet.opCode == 302 and packet.sender == 1 then
      cdl:signal()
    else
      error(packet:toString())
    end
  end

  self.ctx.sessions[4].onPacketCB = function(packet)
    if packet.opCode == 301 then
      cdl:signal()
    elseif packet.opCode == 302 and packet.sender == 1 then
      cdl:signal()
    else
      error(packet:toString())
    end
  end

  self.ctx.sessions[1]:start()
  self.ctx.sessions[2]:start()
  self.ctx.sessions[3]:start()
  self.ctx.sessions[4]:start()
  
  cdl:wait(15, function(timedout)
    self.ctx:stop()
  
    assert(not timedout, "Messages not recieved.")
    
    writeText("PASSED!\n")
    
    TestNewPacket.mFinished = true
  end)
end

return TestNewPacket