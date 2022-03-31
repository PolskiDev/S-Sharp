# S# - S (sharp) Programming Language
<center><img src="img/logo/S_Sharp.png" height="300px"/></center>

S# is a programming language that compiles to Lua Virtual Machine
native code. Some syntax elements were inspired on programming
languages like: C#, PHP and OCaml.  
  
Why create a new programming language?
One day... I was in terrible boredom,
I used to have nothing to do...
So I thought, why not create
a programming language?
My idea was to bring some syntax elements from C# and the syntax confusion from OCaml, next develop a compiler that gives output
as *(.lua)* or *(.luac)* files. Since Lua compiles really fast
even on old or simple hardware, S# could run on any operating system and on any machine, including do some tests with an auxiliary parser that I thought of implementing. That's why I spent a whole day creating this programming language that runs on Lua Virtual Machine, only to have something to do.

<center><i>Developed by Gabriel Margarido</i></center>


### 0A. Compile S# program (<u>bytecode</u> - *.luac*):
```
Generate bytecode (Windows 64-bit):
lua ssc helloworld.ss -b helloworld

Generate bytecode (UNIXes)
./lua ssc helloworld.ss -b helloworld
```

### 0B. Compile S# program (<u>object</u> - *.lua*):
```

Generate Lua File (Windows 64-bit):
lua ssc helloworld.ss -o helloworld

Generate Lua File (UNIXes)
./lua ssc helloworld.ss -o helloworld

```
  
  



### 1. Basic S# program structure:  
  
```
(import) |s-sharp.lang|
(import) |s-sharp.stdio|
(import) |s-sharp.stdlib|
(import) |s-sharp.stdtab|
(import) |s-sharp.loops|
(import) |s-sharp.mem|
(import) |s-sharp.file|
(import) |s-sharp.os|
(import) |s-sharp.fn|

namespace "yourprogram"
    #@ TODO CODE HERE

..?

```
  
### 2. Comments  
  
```
#@ My little comment
```
  
### 3. Print on the screen

A. This is how to print strings in S#.  
```
Console.WriteLine "Hello world"

Console.Write "Hello world"
```

B. This is how to print variables on the screen.  
```
Console.WriteLine |$msg|

Console.Write |$msg|
```

### C. Variables are always declared between **| x |** and with a (dollar sign)  **$**  before the variable name. To declare a variable, we use the method *let*.  

The **&** symbol is only used on a variable assign or function return to make a reference to a string, just like the **$** is used to make a reference to a variable at the declaration and assign.

**Local variables**
```
#@ String variable  (uses at beginning: &)
let( |$msg|, "&Hello world")


#@ Variable-reference variable  (uses at beginning: $)
let ( |$msg|, |$other_var| )


#@ Number variable  (uses at beginning: **NOTHING**)
let ( |$msg|, 132)
let ( |$msg|, 132.560356)
```

**Global and reassign variables**  
```
#@ Global/reassign string variable  (uses at beginning: &)
var( |$msg|, "&Hello world")


#@ Global/reassign variable-reference variable  (uses at beginning: $)
var ( |$msg|, |$other_var| )


#@ Global/reassign number variable  (uses at beginning: **NOTHING**)
var ( |$msg|, 132)
var ( |$msg|, 132.560356)
```

Note: For declaration of null variables,  
can be used the null value:   **|NULL|**


**Packaging elements**  
Basically, package elements means that you are going to put/list
elements, such as: variables (global or local) and functions (private or public), inside a single package/table. To do this, the only thing you should make is:


```
#@ Packaged string variable  (uses at beginning: &)

module "client"
var( |$client.msg|, "&Hello world")


#@ Lonely string variable  (uses at beginning: &)
var( |$msg|, "&Hello world")



```

Note: For declaration of null variables,  
can be used the null value:   **|NULL|**


### D. Read data from user  

**Local Input**
```
let (|$line|, |NULL|)
Console.ReadLine |$line|
```

**Global Input**
```
Console.ReadLine |$line|
```


### E1. Get string length via *$len?*

**Store into a variable**  
Remember: Use always double quotes inside | x |
```
let (|$size|, |$len? "This is yet another programming language"|)
```

**Use directly**  
Remember: Use always double quotes inside | x |
```
Console.WriteLine |$len? "This is yet another programming language"|
```


### E2. Get string length via *String.length(str)*

**Store into a variable**  
Remember: Use always double quotes inside | x |
```
let (|$size|, String.length("This is yet another programming language") )
```

**Use directly**  
```
Console.WriteLine( String.length("This is yet another programming language") )
```


### F. Structures

**Conditionals:  if, elseif and else**  
```
if:? |a == 3| >>
    @# CODE HERE

elseif:? |b < 7| >>
    @# CODE HERE

else:?
    @# CODE HERE

..;

```


**Looping:  while, for, do-until**
```
while? |a < 7| >>
    #@ CODE HERE

..;

```

If the step wasn't specified, it is always going to be (1).
*for? (|iterator|, begin,end, step)*  

```
for? (|i|, 0,100) >>
    #@ CODE HERE

..;


for? (|i|, 0,100, 1) >>
    #@ CODE HERE

..;

```


If the step wasn't specified, it is always going to be (1).
*do? ... until? (condition)*  
```
do?
    #@ CODE HERE

until? |a > 56|
```

S# also offers a new way to work with infinite loops and break statement. See an example:

```
loop?
    if:? | a > 10| >>
        break?
    ..;

..;
```

### G. Functions (private and public)  
  
**A. Public function**
```
fn? ("hello", |a, b, c|)
    #@ CODE HERE
    
..;
```
  
  
**B. Private function (@)**
```
fn? ("@hello", |a, b, c|)
    #@ CODE HERE

..;

```

**(AB1) Call public/private <u>lonely</u> functions (args)**
```
Syscall('hello', |"George", "Julian", "Dean"|)
```
  
  
  
  
**(AB2) Call public/private <u>lonely</u> functions (no args)**
```
Syscall('hello')
```
  



**C. Packaged private function**
```
module "client"
fn? ("@client.hello", |a, b, c|)
    #@ CODE HERE

..;

```

**D. Packaged public function**
```
module "client"
fn? ("client.hello", |a, b, c|)
    #@ CODE HERE

..;

```

**(CD1) Call public/private <u>packaged</u> functions (args)**
```
Syscall('client.hello', |"George", "Julian", "Dean"|)
```
  
    
**(CD2) Call public/private <u>lonely</u> functions (no args)**
```
Syscall('client.hello')
```
  



### H. Return types

**String return**
```
ret "&This is my return"

```

**Variable return**
```
ret |$msg|

```

**Number return**
```
ret (146)

```

### I. Increment and decrement

**Increment {  inc |var:number|  }**
```
inc |$counter:1|

```

**Decrement {  dec |var:number|  }**
```
dec |$counter:1|

```


### J. String manipulation

**Replace string**
```
let( |$msg|, "&Hello world")
String.replace(|$msg|, "world","Jacob!")
```

**Slice string**
```
let( |$msg|, "&Hello world")
String.slice(|$msg|, 5)


let( |$msg|, "&Hello world")
String.slice(|$msg|, 3,10)
```
Note: You can also use *String.substring* instead of *String.slice*


**Get index of character/string**
```
let( |$msg|, "&Hello world")
String.getIndexOf(|$msg|,"l")

```
Note: You can also use *String.find* instead of *String.getIndexOf*


**Put the whole string to uppercase**
```
let( |$msg|, "&Hello world")
let ( |$upper_msg|, String.uppercase(|$msg|) )

```
**Put the whole string to lowercase**
```
let( |$msg|, "&Hello world")
let ( |$upper_msg|, String.lowercase(|$msg|) )

```

**Put the whole string in reverse order**
```
let( |$msg|, "&Hello world")
let ( |$upper_msg|, String.reverse(|$msg|) )

```

**Get the string length (1)**
```
let( |$msg|, "&Hello world")
let ( |$upper_msg|, String.length(|$msg|) )

```

**Get the string length (2)**
```
let( |$msg|, "&Hello world")
let ( |$size|, |$len? msg| )

```


**Variable string concatenation**
```
let( |$msg_1|, "&Hello ")
let( |$msg_2|, "&world")

let ( |$final|, |$msg_1 .. msg_2|)

```
Note: When concatenating two variables, the *dollar sign* **($)**
is only placed at the **first** variable. 


**Direct string concatenation**
```
let ( |$final_direct|, |"Hello ".."world"|)

```
Note: Double quotes are always used when between pipes |x|. 


**Boolean values (reserved keywords)**
```
Import external library:        (import) |path.to.module|
After statement (do)/(then):    >>


Boolean reserved keywords:
    |TRUE|    |FALSE|

Oposite boolean reserved keywords:
    |!TRUE|   |!FALSE|

Null reserved keyword:
    |NULL|

```
  

### K. Structures/Tables

**Create new structure (table/array)**  
Structures, arrays or tables are used to storage data. Unlike C, we can storage different types of data inside the same structure (struct). Structures can be also used as arrays. It's also possible to put a structure inside another structure, it means that we can create multidimensional arrays (structures). Do not forget to put **@$** or **$** <u>before the structure name</u>, since it's <u>a kind of variable</u>.
  

**Private structures (@$)**
```
#@ Same data type
Struct.new("@$myTable", |1, 2, 3, 4, 5, 6, ... | )


#@ Different data type
Struct.new("@$myTable", |"Michael", 2, 3, 4, "David", 3.141532, 6.0, ...| )

```
  
  

**Public structures ($)**
```
#@ Same data type
Struct.new("$myTable", |1, 2, 3, 4, 5, 6, ... | )


#@ Different data type
Struct.new("$myTable", |"Michael", 2, 3, 4, "David", 3.141532, 6.0, ... | )

```
  


**Structure Methods**
```
#@ Organize all elements inside the structure from lower to higher.
Struct.SortFromLower("$myTable")


#@ Iterate (i) a structure and print each index on the screen (multiple lines).
Struct.iterate( |i|,"$myTable" )


#@ Iterate (i) a structure and print each index on the screen (single line).
Struct.iterate( |i|,"$myTable", |TRUE| )


#@ Add elements to the current structure
#@ ( exit variable [$storage], position [of array (3)], related variable [string ($v)] )

let (|$v|, "&Dean")
Struct.add( |$storage|, 3, |$v| )
Console.WriteLine |$storage|



#@ Remove element from an index of current structure
#@ ( exit variable [$storage], position [of array (3)],

Struct.remove( |$storage|, 3 )
Console.WriteLine |$storage|



#@ Get value from structure index

let ( |$price|, Struct.GetPosition("$myTable", 4) )
Console.WriteLine |$price|


#@ Join all elements from a structure together in another element.
#@ Exit on |$storage|, joining together all from "$myTable"
#@ separating each element by using spacebar (" ")

Struct.join( |$storage|, "$myTable", " ")

```
  
  
### K. File manipulation
  
**Write to file**
```
#@String to write
let ( |$myfile_text|, "&Hello world!")

#@File Path
let ( |$myfile|, "&file.txt")

    #@Open and write to file
    File.open(|$storage|, |-write|,|$myfile|)
    File.write(|$storage|,|$myfile_text|)

File.close |$storage|

```
  
  
**Append to file**
```
#@String to append
let ( |$myfile_text|, "&Appended Hello world!")

#@File Path
let ( |$myfile|, "&file.txt")
    
    #@Open and write to file
    File.open(|$storage|, |-append|,|$myfile|)
    File.write(|$storage|,|$myfile_text|)

File.close |$storage|
  


```
  
  
**Read from file**
```
#@File Path
let ( |$myfile|, "&file.txt")

    #@Open and read file
    File.open(|$storage|, |-read|,|$myfile|)
    File.read(|$final|, |$storage|)

File.close |$storage|

#@Throw Output
Console.WriteLine |$final|
```
  

**Execute Shell Commands**  
```
System.Process "start binary.exe"
```

```
System.Process "uname -a"
```


**Call Lua <u>variables</u> from S#**  
  


```
(import) |path.to.lua.module|
Console.WriteLine |$math.pi|

```


**Call Lua <u>functions</u> from S# with arguments**  
 
```
(import) |path.to.lua.module|
Syscall('luafunction', |"arg1", "arg2", "arg3", ...|)

```


**Call Lua <u>functions</u> from S# without arguments** 
```
(import) |path.to.lua.module|
Syscall('luafunction')

```

Developed by Gabriel Margarido  
March 30th, 2022