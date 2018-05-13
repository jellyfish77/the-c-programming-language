# the compiler: $(CC) for C program, define as g++ for C++
CC = gcc

# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
#  -O2   optimization level 2
#  -O0   default optimization
CFLAGS  = -ggdb -Wall -O0 -g

# define folders
SRC = /src
INCL = /include
LIB = /lib
OBJ = /obj
BIN = /bin

# Use the shell find command to get the source tree
SOURCES := $(shell find * -type f -name "*.c")
# Keep the source tree into the objects tree
OBJECTS := $(addprefix $(OBJ)/,$(SOURCES:.c=.o))

sources = *.c
objects = $(subst .c,.o,$(sources))


# add all files to build here
all: otherstuff clean 
	@echo Builing libraries...
	$(call build_object,.$(LIB),functions.c,.$(OBJ),functions.o)
	
	@echo Building sources...
	$(call build_object,.$(SRC)/ch8,8.2.1.c,.$(OBJ)/ch8,8.2.1.o)
	$(call build_object,.$(SRC)/ch8,8.2.2.c,.$(OBJ)/ch8,8.2.2.o)
	$(call build_object,.$(SRC)/ch8,variable_args.c,.$(OBJ)/ch8,variable_args.o)
	
	@echo Linking objects...
	$(call link_objects,$(BIN)/ch8,8.2.1,.$(OBJ)/ch8/8.2.1.o .$(OBJ)/functions.o)
	$(call link_objects,$(BIN)/ch8,8.2.2,.$(OBJ)/ch8/8.2.2.o)
	$(call link_objects,$(BIN)/ch8,variable_args, .$(OBJ)/ch8/variable_args.o)
	
clean:
	@echo Cleaning folders...
	@rm ./obj -rf; rm ./bin -rf

otherstuff:
	@echo Files to be compiled: $(SOURCES)
	@echo

#build object from source "$(1)/$(2)":
define build_object
	@mkdir $(3) -p
	@$(CC) $(CFLAGS) -o $(3)/$(4) -c $(1)/$(2)
endef

#link all supplied objects into binary "$(1)/$(2)"...
define link_objects
	@mkdir .$(1) -p
	@$(CC) $(CFLAGS) -o .$1/$2 $3
endef


