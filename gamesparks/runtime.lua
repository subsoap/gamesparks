local socket = require 'builtins.scripts.socket'

runtime = {}
runtime.enterFrameEvents = {}
runtime.enterFrameID = nil
runtime.enterFrameRunning = false
runtime.startTime = socket.gettime()

function runtime.getTimer()
	return (socket.gettime() - runtime.startTime) * 1000
end

function runtime.addEventListener(eventName, listener)
 	if eventName == "enterFrame" then
 		table.insert(runtime.enterFrameEvents, listener)
 		
 		if runtime.enterFrameID == nil then
 			runtime.enterFrameID = timer.repeating(1.0 / 60.0, function()
 				if not runtime.enterFrameRunning then
 					runtime.enterFrameRunning = true
 					
 					local event = {}
 					event.name = eventName
 					event.time = runtime.getTimer()
 					
 					for i, v in ipairs(runtime.enterFrameEvents) do
 						if type(v) == "function" then
				 			pcall(function() v(event) end)
				 		elseif type(v) == "table" then
				 			pcall(function() v:enterFrame(event) end)
				 		else
				 			print("WARNING: type listener unknown")
				 		end
 					end
 					
 					runtime.enterFrameRunning = false
 				else
 					print("WARNING: enterFrame still running")
 				end
 			end)
 		end
 	end
end
  
function runtime.removeEventListener(eventName, listener)
  	if eventName == "enterFrame" then
  		--while not runtime.enterFrameRunning do end
  		
 		for i, v in ipairs(runtime.enterFrameEvents) do
	    	if v == listener then
	      		table.remove(runtime.enterFrameEvents, i)
	      		
	      		return
	      	end
	    end
 	end
end
