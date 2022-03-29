String = {}

-- let( |$string| , String.replace( |$phrase|, "ph","f" ) )
function String.replace(str, a,b)
    return str:sub(2)..":gsub("..a..","..b..")"
end

-- let( |$string| , String.substring( |$phrase|, 1,3 ) )
function String.substring(str, a,z)
    if z == nil then
        return str:sub(2)..":sub("..a..")"
    else
        return str:sub(2)..":sub("..a..","..z..")"
    end
    
end

-- let( |$string| , String.slice( |$phrase|, 1,3 ) )
function String.slice(str, a,z)
    String.substring(str, a,z)
end


-- let( |$string|, String.getIndexOF(|$phrase|, "you") )
-- let( |$string|, String.getIndexOF(|$phrase|, "%.") )
function String.getIndexOf(str,char)
    return str:sub(2)..":find("..char..")"
end
function String.find(str,char)
    String.getIndexOf(str,char)
end


-- let( |$string|, String.uppercase("hello world") )
-- let( |$string|, String.lowercase("hello world") )
-- let( |$string|, String.reverse("hello world") )
function String.uppercase(str)
    return "string.upper("..str..")"
end
function String.lowercase(str)
    return "string.lower("..str..")"
end
function string.reverse(str)
    return "string.reverse("..str..")"
end


-- let( |$string|, String.length("hello world") )
-- let( |$string|, len? "Hello World")
function String.length(str)
    return "string.len("..str..")"
end