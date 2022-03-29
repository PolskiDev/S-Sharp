function module(name)
    if name:sub(1,1) == "@" then
        file:write("local "..name.." = {}")
    else
        file:write(name.." = {}")
    end
    
end

function let(name,value)
    if value:sub(1,1) == "$" then
        -- Variable:    $msg
        file:write("local "..name:sub(2).." = "..value:sub(2),'\n')
    
    elseif value:sub(1,1) == "&" then
        -- String:      &Arnold
        file:write("local "..name:sub(2).." = \""..value:sub(2).."\"",'\n')
    else
        -- Number:      136
        file:write("local "..name:sub(2).." = "..value,'\n')
    end
end


function var(name,value)
    if value:sub(1,1) == "$" then
        -- Variable:    $msg
        file:write(name:sub(2).." = "..value:sub(2),'\n')
    
    elseif value:sub(1,1) == "&" then
        -- String:      &Arnold
        file:write(name:sub(2).." = \""..value:sub(2).."\"",'\n')
    else
        -- Number:      136
        file:write(name:sub(2).." = "..value,'\n')
    end
end


function inc(pattern)
    local var = pattern:sub(2,pattern:find(":")-1)
    local num = pattern:sub(pattern:find(":")+1,#pattern)
    file:write(var.." = "..var.." + "..num,'\n')
end
function dec(pattern)
    local var = pattern:sub(2,pattern:find(":")-1)
    local num = pattern:sub(pattern:find(":")+1,#pattern)
    file:write(var.." = "..var.." - "..num,'\n')
end