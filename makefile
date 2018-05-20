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
	$(call build_object,.$(SRC)/ch1,1.1.13.c,.$(OBJ)/ch1,1.1.13.o)
	$(call build_object,.$(SRC)/ch5,pointers.c,.$(OBJ)/ch5,pointers.o)
	$(call build_object,.$(SRC)/ch8,8.2.1.c,.$(OBJ)/ch8,8.2.1.o)
	$(call build_object,.$(SRC)/ch8,8.2.2.c,.$(OBJ)/ch8,8.2.2.o)
	$(call build_object,.$(SRC)/ch8,variable_args.c,.$(OBJ)/ch8,variable_args.o)
	$(call build_object2,ch8,ternary_operators)	
	
	@echo Linking objects...
	$(call link_objects,$(BIN)/ch1,1.1.13,.$(OBJ)/ch1/1.1.13.o .$(OBJ)/functions.o)
	$(call link_objects,$(BIN)/ch5,pointers, .$(OBJ)/ch5/pointers.o)
	$(call link_objects,$(BIN)/ch8,8.2.1,.$(OBJ)/ch8/8.2.1.o .$(OBJ)/functions.o)
	$(call link_objects,$(BIN)/ch8,8.2.2,.$(OBJ)/ch8/8.2.2.o)
	$(call link_objects,$(BIN)/ch8,variable_args, .$(OBJ)/ch8/variable_args.o)
	$(call link_objects,$(BIN)/ch8,ternary_operators, .$(OBJ)/ch8/ternary_operators.o)

clean:
	@echo Cleaning folders...
	@rm ./obj -rf; rm ./bin -rf

otherstuff:
	@echo Source files found: $(SOURCES)
	@echo

#build object file from source file
#	params:
#		$(1) source folder
#		$(2) source file
#		$(3) output folder
#		$(4) output file
define build_object
	@mkdir $(3) -p
	#$(1)/$(2) -> $(3)/$(4)
	@$(CC) $(CFLAGS) -o $(3)/$(4) -c $(1)/$(2)
endef

define build_object2
	@mkdir .$(OBJ)/$(1)-p
	#.$(SRC)/$(1)/$(2).c -> .$(OBJ)/$(1)/$(2).o
	@$(CC) $(CFLAGS) -o .$(OBJ)/$(1)/$(2).o -c .$(SRC)/$(1)/$(2).c
endef

#link all supplied objects into binary
#	params:
#		$(1) output folder
#		$(2) output file 
#		$(3) input object files
define link_objects
	@mkdir .$(1) -p
	#$(3) -> $(1)/$(2)
	@$(CC) $(CFLAGS) -o .$1/$2 $3
endef


