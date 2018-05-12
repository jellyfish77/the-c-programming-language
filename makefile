#instructions:
#	Set up dependancies under "all" target
#	set the target filename variable for the source file

# the compiler: $(CC) for C program, define as g++ for C++
CC = gcc

# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
#  -O2   optimization level 2
#  -O0   default optimization
CFLAGS  = -ggdb -Wall -O0 -g

# relative paths (not sure if this is best practice)
SRC = /src
INCL = /include

all: clean 
	$(call build_libraries)
	$(call build_binary,8.2.1,$(SRC)/ch8)

clean:
	#setup output folders:
	mkdir ./obj -p; rm ./obj/* -f; mkdir ./bin -p; rm ./bin/* -f

define build_libraries
	#build library object file(s):
	$(CC) $(CFLAGS) -o ./obj/functions.o -c ./lib/functions.c
endef

define build_binary
	#build object file for $(1).c:
	$(CC) $(CFLAGS) -o ./obj/$(1).o -c .$(2)/$(1).c

	#link object files and libraries into binary:
	$(CC) $(CFLAGS) -o ./bin/$1 ./obj/$1.o ./obj/functions.o
endef






