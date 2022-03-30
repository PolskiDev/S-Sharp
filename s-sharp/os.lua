System = {}

function System.Process(cmd)
    file:write("os.execute(\""..cmd.."\")")
end