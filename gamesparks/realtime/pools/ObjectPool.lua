LinkedList = LinkedList or require("gamesparks.LinkedList")

local ObjectPool = {}
local ObjectPool_mt = {__index = ObjectPool}

function ObjectPool.new(creator, refresher, maxSize)
  local instance = {}
  
  instance.stack = LinkedList.new()
  instance.creator = creator
  instance.refresher = refresher
  instance.maxSize = maxSize
  
  return setmetatable(instance, ObjectPool_mt)
end

function ObjectPool:pop()
  if LinkedList.length(self.stack) == 0 then
    return self.creator()
  else
    return LinkedList.popfirst(self.stack)
  end
end

function ObjectPool:push(item)
  if item ~= nil then
    if LinkedList.search(self.stack, item) ~= nil then
      return
    end
    if LinkedList.length(self.stack) < self.maxSize then
      if self.refresher ~= nil then
        self.refresher(item)
      end
      LinkedList.pushlast(self.stack, item)
    end
  end
end

function ObjectPool:dispose()
  self.stack = LinkedList.new()
  
  collectgarbage("collect")
end

return ObjectPool