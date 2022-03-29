Console = {}
--[[
    [GLOBAL INPUT]
    let (|$line|, |NULL|)
        ...
        ...
        Console.ReadLine(|$line|)


    [LOCAL INPUT]
    Console.ReadLine(|$line|)

]]

function Console.ReadLine(s)
    file:write(s:sub(2).." = io.read()",'\n')
end


function Console.WriteLine(s)
    if s:sub(1,1) == "$" then
        file:write("print("..s:sub(2)..")",'\n')
    
    elseif s:sub(1,1) == "&" then
        file:write("print("..s:sub(2)..")",'\n')

    else
        file:write("print(\""..s.."\")",'\n')
    end
    
end
function Console.Write(s)
    if s:sub(1,1) == "$" then
        file:write("io.write("..s:sub(2)..")",'\n')

    elseif s:sub(1,1) == "&" then
        file:write("io.write("..s:sub(2)..")",'\n')

    else
        file:write("io.write(\""..s.."\")",'\n')
    end
    
end