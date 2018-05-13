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
	$(call build_object,.$(SRC)/ch8,8.2.1.c,.$(OBJ)/ch8,8.2.1.o)
	$(call build_object,.$(LIB),functions.c,.$(OBJ),functions.o)
	$(call build_object,.$(LIB),functions2.c,.$(OBJ),functions2.o)
	$(call link_objects,$(BIN)/ch8,8.2.1,.$(OBJ)/ch8/8.2.1.o .$(OBJ)/functions.o)

clean:
	rm ./obj -rf; rm ./bin -rf

#build object from source "$(1)/$(2)":
define build_object
	mkdir $(3) -p
	$(CC) $(CFLAGS) -o $(3)/$(4) -c $(1)/$(2)
endef

#link all supplied objects into binary "$(1)/$(2)"...
define link_objects
	mkdir .$(1) -p
	$(CC) $(CFLAGS) -o .$1/$2 $3
endef


