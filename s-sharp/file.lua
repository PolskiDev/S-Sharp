File = {}

--@Put file in the memory
function File.open(storage, mode,filename)
    local _mode = nil
    if mode == "-write" then _mode = "w" end
    if mode == "-read" then _mode = "r" end
    if mode == "-append" then _mode = "a" end
     
    file:write(storage:sub(2).." = io.open("..filename:sub(2)..", \"".._mode.."\")",'\n')
end


--@Functionalities
function File.read(exitVar, storage)
    file:write(exitVar:sub(2).." = "..storage:sub(2)..":read \"*a\"",'\n')
end
function File.write(storage,text)
    file:write(storage:sub(2)..":write("..text..")",'\n')
end
function File.close(storage)
    file:write(storage:sub(2)..":close()",'\n')
end