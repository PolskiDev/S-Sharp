-- [*PUBLIC FUNCTION]
-- fn? ("hello", |a, b, c|)
-- ..;

-- [*PRIVATE FUNCTION]
-- fn? ("@hello", |a, b, c|)
-- ..;


function declare_function(name, arguments)
    if name:sub(1,1) == "@" then
        file:write("local function "..name:sub(2).."("..arguments..")",'\n')
    else
        file:write("function "..name.."("..arguments..")",'\n')
    end
    
end

function ret(val)
    if val:sub(1,1) == "&" then
        file:write("return \""..val:sub(2).."\"",'\n')
    
    elseif val:sub(1,1) == "$" then
        file:write("return "..val:sub(2),'\n')
    else
        file:write("return "..val,'\n')
    end
    
end

function Syscall(fun_name,arguments)
    if arguments:sub(1,1) == "&" then
        file:write(fun_name.."(\""..arguments:sub(2).."\")",'\n')

    elseif arguments:sub(1,1) == "$" then
        file:write(fun_name.."("..arguments:sub(2)..")",'\n')
    else
        file:write(fun_name.."("..arguments..")",'\n')
    end    
        
end
