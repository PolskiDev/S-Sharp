--[[
    Free Software License: (BSD 2-clause license)
    Copyright 2022 Gabriel Margarido

    Redistribution and use in source and binary forms,
    with or without modification, are permitted provided
    that the following conditions are met:

    1. Redistributions of source code must retain the above
    copyright notice, this list of conditions and the following
    disclaimer.

    2. Redistributions in binary form must reproduce the above
    copyright notice, this list of conditions and the following
    disclaimer in the documentation and/or other materials provided
    with the distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.

]]



local open = io.open    
local function read_file(path)
    local file = open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end


fs = arg[1]
local token = read_file(fs);


-- token list
token = token:gsub("TRUE","true")
token = token:gsub("FALSE","false")

token = token:gsub("!TRUE","false")
token = token:gsub("!FALSE","true")

token = token:gsub("NULL","nil")


token = token:gsub("%.%.;",           "declare_end()")    -- close block     (..;)
token = token:gsub(";;",            "()")               -- end block
token = token:gsub("|",             "\'")               -- pipe to double quotes

token = token:gsub("%(import%)",    "require")          -- import external packages
token = token:gsub(">>", "")                            -- do | then


token = token:gsub("%.%.%?",        "interrupt()")      -- end of program (..?)
token = token:gsub("#@",            "--")               -- single-line comment
token = token:gsub("len%? ",        "#")                -- (len? )        len? number  =   #number

token = token:gsub("while%? ",      "declare_while")    -- while statement     while? (condition)
token = token:gsub("for%? ",        "declare_for")      -- for statement       for? (condition)

token = token:gsub("if%? ",         "declare_if")       -- if statement        if? (condition)
token = token:gsub("elseif:%? ",     "declare_elseif")   -- elseif statement    elseif:? (condition)
token = token:gsub("else%?",        "declare_else()")   -- else statement      else?
                                                        --                     ..;

token = token:gsub("do%?",          "declare_repeat()") -- do... statement        do?
token = token:gsub("until%? ",      "declare_until")    -- ...until statement     until? (condition)

token = token:gsub("fn%? ",         "declare_function ") -- function (private)           fn? (|@name| "a, b, c, ...")
                                                        --                              ..;

                                                        -- function (public )           fn? (|name| "a, b, c, ...")
                                                        --                              ..;

-- write parsed file
local parsed = io.open(arg[3], "w")
parsed:write(token)
parsed:close()


