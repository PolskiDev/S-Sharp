function declare_loop()
    file:write("while true do",'\n')
end

function declare_while(condition)
    file:write("while "..condition.." do",'\n')
end
function declare_for(i,min,max,step)
    if step == nil then step = 1 end
    file:write("for "..i.."="..min..","..max..","..step.." do",'\n')
end


function declare_if(condition)
    file:write("if "..condition.." then",'\n')
end
function declare_elseif(condition)
    file:write("elseif "..condition.." then",'\n')
end
function declare_else(condition)
    file:write("else",'\n')
end


function declare_repeat()
    file:write("repeat",'\n')
end
function declare_until(condition)
    file:write("until "..condition,'\n')
end



function declare_end(name,value)
    file:write("end",'\n')
end
function declare_break()
    file:write("break",'\n')
end