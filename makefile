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

# the build target executable:

TARGET = 8.2.1
TARGET_PATH = /src/ch8

LINKED_BINARY = $(TARGET)



#format:
#[label]: [list of prerequites] 
#	commands to execute when [label] called...

# link object files into binary
all: clean functions.o $(TARGET).o
	$(CC) $(CFLAGS) -o ./bin/$(LINKED_BINARY) ./obj/$(TARGET).o ./obj/functions.o

# build object file
$(TARGET).o: 
	$(CC) $(CFLAGS) -o ./obj/$(TARGET).o -c .$(TARGET_PATH)/$(TARGET).c

# build functions object file 
functions.o: 
	$(CC) $(CFLAGS) -o ./obj/functions.o -c ./lib/functions.c

# make sure output folders exist remove all existing files
clean:
	mkdir ./obj -p; rm ./obj/* -f; mkdir ./bin -p; rm ./bin/* -f
