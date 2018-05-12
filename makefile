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
LIB = /lib
OBJ = /obj
BIN = /bin

all: clean 
#	$(call build_libraries,functions,$(LIB),%(OBJ))
#	$(call build_binary,8.2.1,$(SRC)/ch8)
#	$(call build,functions,$(LIB),$(OBJ))
	$(call build_object,/ch8,8.2.1,$(SRC),$(OBJ))
	$(call build_object,$(LIB),functions,,$(OBJ))
	$(call link_objects,/ch8,8.2.1,.$(OBJ)/ch8/8.2.1.o,.$(OBJ)$(LIB)/functions.o)
	
clean:
	#setup output folders:
	rm ./obj -rf; mkdir ./obj -p; rm ./bin -rf; mkdir ./bin -p

define build_libraries
	#build object file for library "$(1).c":
	$(CC) $(CFLAGS) -o .$(OBJ)/$(1).o -c .$(LIB)/$(1).c
endef

define build_binary
	#build object file for source "$(1).c":
	$(CC) $(CFLAGS) -o ./obj/$(1).o -c .$(2)/$(1).c

	#link object files and libraries into binary:
	$(CC) $(CFLAGS) -o ./bin/$1 ./obj/$1.o ./obj/functions.o	
endef

define build_object 
	mkdir .$(4)$(1)
	$(CC) $(CFLAGS) -o .$(4)$(1)/$(2).o -c .$(3)$(1)/$(2).c
endef

define link_objects
	mkdir .$(BIN)$1
	$(CC) $(CFLAGS) -o .$(BIN)$1/$2 $3 $4
endef



