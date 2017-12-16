local date = require("gamesparks.lua-date")

function dateToRFC3339(d)
  return d:fmt("${iso}")
end
  
function rfc3339toDate(rfc3339)
  return date(rfc3339)
end

function getTime()
   local a,b = math.modf(os.clock())
   
   if b == 0 then 
      b = '000' 
   else 
      b = tostring(b):sub(3, 5) 
   end
   
   return tostring(os.time()) .. b
end

function getTime2()
   local a,b = math.modf(os.clock())
   
   if b == 0 then 
      b = '000' 
   else 
      b = tostring(b):sub(3, 5) 
   end
   
   return tostring(os.date("%X")) .. "." .. b
end

function lines(str)
  local t = {}
  
  local function helper(line) table.insert(t, line) return "" end
  
  helper((str:gsub("(.-)\r?\n", helper)))
  
  return t
end

function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

table.copy = function(orig)
	local orig_type = type(orig)
    local copy
    
    if orig_type == 'table' then
        copy = {}
        
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else
        copy = orig
    end
    
    return copy
end
