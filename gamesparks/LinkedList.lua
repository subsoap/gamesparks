LinkedList = {}

function LinkedList.new()
  return {previous = nil, value = nil, next = nil}
end

function LinkedList.index(linkedList, pos)
  local index = 0
  local currList = linkedList
  
  if currList == nil then
    return nil
  end
  
  repeat
    if index == pos then
      return currList.value
    end
    
    index = index + 1
    
    currList = currList.next
  until currList == nil
  
  return nil
end

function LinkedList.search(linkedList, value)
  local currList = linkedList
  
  if currList == nil then
    return nil
  end
  
  repeat
    if currList.value == value then
      return currList
    end
    
    currList = currList.next
  until currList == nil
  
  return nil
end

function LinkedList.length(linkedList)
  local currList = linkedList
  local length = 0
  
  if currList == nil then
    return 0
  end
  
  repeat
    if currList.value ~= nil then
      length = length + 1
    end
    
    currList = currList.next
  until currList == nil
  
  return length
end

function LinkedList.pushfirst(linkedList, value)
  local exit = false
  
  if linkedList == nil then
    return
  end
  
  if linkedList.value == nil then
    linkedList.value = value
  else
    repeat
      if linkedList.previous == nil then
        local newLinkedList = LinkedList.new()
      
        newLinkedList.value = value
        newLinkedList.next = linkedList
      
        linkedList.previous = newLinkedList
        
        exit = true
      else
        linkedList = linkedList.previous
      end
    until exit
  end
end

function LinkedList.pushlast(linkedList, value)
  local exit = false

  if linkedList == nil then
    return
  end
  
  if linkedList.value == nil then
    linkedList.value = value
  else
    repeat
      if linkedList.next == nil then
        local newLinkedList = LinkedList.new()
        
        newLinkedList.previous = linkedList
        newLinkedList.value = value
        
        linkedList.next = newLinkedList
        
        exit = true
      else
        linkedList = linkedList.next
      end
    until exit
  end
end

function LinkedList.popfirst(linkedList)
  if linkedList == nil then
    return nil
  end
  
  local value = linkedList.value
  local nextList = linkedList.next
  
  if nextList ~= nil then
    linkedList.value = nextList.value
    linkedList.next = nextList.next
    
    if nextList.next ~= nil then
      nextList.next.previous = linkedList
    end
  else
    linkedList.value = nil
  end
  
  return value
end

function LinkedList.poplast(linkedList)
  if linkedList == nil then
    return nil
  end
  
  while linkedList.next ~= nil do
    linkedList = linkedList.next
  end
  
  local value = linkedList.value
  local previousList = linkedList.previous
  
  if previousList ~= nil then
    linkedList.previous = previousList.previous
    linkedList.value = previousList.value
    
    if previousList.previous ~= nil then
      previousList.previous.next = linkedList
    end
  else
    linkedList.value = nil
  end
  
  return value
end

function LinkedList.pop(linkedList)
  if linkedList == nil then
    return nil
  end
  
  local value = linkedList.value
  local previousList = linkedList.previous
  local nextList = linkedList.next
  
  linkedList.value = nil
  
  if previousList ~= nil then
    linkedList.previous = previousList.previous
    linkedList.value = previousList.value
    
    if previousList.previous ~= nil then
      previousList.previous.next = linkedList
    end
  end
  
  if nextList ~= nil then
    if linkedList.value == nil then
      linkedList.value = nextList.value
    end
    linkedList.next = nextList.next
    
    if nextList.next ~= nil then
      nextList.next.previous = linkedList
    end
  end
  
  return value
end

function LinkedList.popWithIndex(linkedList, pos)
  local index = 0
  local currList = linkedList
  
  if currList == nil then
    return nil
  end
  
  repeat
    if index == pos then
      return LinkedList.pop(currList)
    end
    
    index = index + 1
    
    currList = currList.next
  until currList == nil
  
  return nil
end

return LinkedList