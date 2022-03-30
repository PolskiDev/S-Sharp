#@ UNIXes
#CC=./lua
#CC=lua

#@ Windows
CC=lua.exe

all: bytecode
bytecode:
	$(CC) ssc helloworld.ss -b helloworld
obj:
	$(CC) ssc helloworld.ss -o helloworld