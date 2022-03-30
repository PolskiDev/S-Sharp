Struct = {}

--@Create new table (public/private)
-- Struct.new("numbers",|1,2,3,4,5,6, ...|)
-- Struct.new("@numbers",|1,2,3,4,5,6, ...|)
function Struct.new(name, value)
    -- body
    if name:sub(1,2) == "@$" then
        file:write("local "..name:sub(3).." = {"..value.."}",'\n')
    elseif name:sub(1,1) == "$" then
        file:write(name:sub(2).." = {"..value.."}",'\n')
    end
    
end

--@Get a value from specific array index
function Struct.GetPosition(name, position)
    return name:sub(2).."["..position.."]"
end

--@Organize all values from lower to high ones
function Struct.SortFromLower(name)
    file:write("table.sort("..name:sub(2)..")",'\n')
end

--@Iterate all indexes of array and print them on the screen
function Struct.iterate(i,name, onlyOneLine)
    if onlyOneLine == nil then
        file:write("for "..i.."=1,#"..name:sub(2).." do",'\n')
        file:write("print("..name:sub(2).."["..i.."])",'\n')
        file:write("end",'\n')
    else
        file:write("for "..i.."=1,#"..name.." do io.write("..name.."["..i.."]..\" \") end",'\n')
    end

end

--@Add or remove elements from array
function Struct.add(arr_name,position,val)
    file:write("table.insert("..arr_name:sub(2)..","..position..","..val:sub(2)..")",'\n')
end
function Struct.remove(arr_name,position)
    file:write("table.insert("..arr_name:sub(2)..","..position..")",'\n')
end


--@ Put all index values together
-- Console.WriteLine |Struct.join("t"," ")|
function Struct.join(storage, name, separator_char)
    file:write(storage:sub(2).." = table.concat("..name:sub(2)..","..separator_char..")",'\n')
end