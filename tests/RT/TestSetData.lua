local TestBase = require("tests.RT.TestBase")
local CountdownLatch = require("tests.RT.CountdownLatch")
local TestUtils = require("tests.RT.TestUtils")

local TestSetData = {}
local TestSetData_mt = {__index = TestSetData}

TestSetData.mFinished = false

local writeText = nil

function TestSetData.new()
  local instance = TestBase.new()
  
  instance.ctx = nil

  return setmetatable(instance, TestSetData_mt)
end

setmetatable(TestSetData, {__index = TestBase})

function TestSetData:getScript()
  return "02_setData"
end

function TestSetData:start(writeTextFunc)
  writeText = writeTextFunc
  
  writeText("TestSetData => ")
  
  print("##############################################")
  print("### TestSetData                            ###")
  print("##############################################")
  
  self.ctx = self:getTestContext(2, false, nil, 
  {"mdgnN4OypCy56LRkLZUReBTxwZ69KFcOwbTulQz5AdyNs/DI1/2qnjIhvf1tWfilOBTiJXWbvtk2zXp3+MaSmWjOYJO48k/baoHpw5RQe0VoFobmw8/qDQ8ognpqJ53fZcgOz26nIN7jHQbxEaBJMPsLVWaNU9OLcBaKTKcmVNEuXhzgI/oOvpmBHqVaJnlyB+9RlFcAQqmndMw6JdusI+Am61JACSxo4oR8HJPaBwS27rAcsonOLdVJHeP7Mhn6ZYLbeub6hSALrNeYqKY+YD1oCWH33KVFzGBHdw4BLaHWuUB/sMG0gqS0a68ZVhWkaQ8j0zpC7H3zs7cf8MYbN6lK+kHq7s+acnHrjDN8Ws/Iuu0KIUjyI8rnSIvyQ1qSpFDS4ol8PItIOl0XHAJYtQ==",
  "pCq0/vvYXpJh22JzFSrh0hTxwZ69KFcOwbTulQz5AdyNs/DI1/2qnjIhvf1tWfilOBTiJXWbvtk2zXp3+MaSmRaPcogMELGDua8SrUqpdn9oFobmw8/qDQ8ognpqJ53fZcgOz26nIN7jHQbxEaBJMPsLVWaNU9OLcBaKTKcmVNEuXhzgI/oOvpmBHqVaJnlyB+9RlFcAQqmndMw6JdusI+Am61JACSxo4oR8HJPaBwS27rAcsonOLdVJHeP7Mhn6ZYLbeub6hSALrNeYqKY+YD1oCWH33KVFzGBHdw4BLaHWuUB/sMG0gqS0a68ZVhWkaQ8j0zpC7H3zs7cf8MYbN6lK+kHq7s+acnHrjDN8Ws/Iuu0KIUjyI8rnSIvyQ1qSN2CdnQJtS73/RoUCYt7Y3Q=="})
  
  local cdl = CountdownLatch.new(7)
  
  self.ctx.sessions[1].onPacketCB = function(packet)
    if packet.opCode == 202 then
      if TestUtils.round(packet.data:getDouble(1), 5) == 2.48771 then
        cdl:signal()   
      else
        error("")
      end
    elseif packet.opCode == 203 then
      if TestUtils.round(packet.data:getFloat(1), 4) == 1.5705 then
        cdl:signal()   
      else
        error("")
      end
    elseif packet.opCode == 204 then
      local v = packet.data:getRTVector(1)
      
      if TestUtils.round(v.x, 3) == 1.123 and TestUtils.round(v.y, 3) == 2.234 and TestUtils.round(v.z, 3) == 3.345 then
        cdl:signal()   
      else
        error("")
      end
    elseif packet.opCode == 205 then
      if packet.data:getLong(2) == 96 then
        cdl:signal()   
      else
        error("")
      end
    elseif packet.opCode == 207 then
      if packet.data:getString(1) == "This is the THIRD line." then
        cdl:signal()   
      else
        error("")
      end
    elseif packet.opCode == 208 then
      if packet.data:getData(1):getString(2) == "!@£$%^&*()-=_+[]{};':|,./<>/?§±`~" then
        cdl:signal()   
      else
        error("")
      end
    elseif packet.opCode == 209 then
      if packet.data:getString(1) == "??????????" then
        cdl:signal()   
      end
    end
  end
  
  self.ctx.sessions[1]:start()
  
  cdl:wait(10, function(timedout)
    self.ctx:stop()
  
    assert(not timedout, "Messages not recieved.")
    
    writeText("PASSED!\n")
    
    TestSetData.mFinished = true
  end)
end

return TestSetData