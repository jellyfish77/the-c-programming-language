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

# the build target executable:
TARGET = in_out_redirect
LINKED_BINARY = $(TARGET)

INCL = /include

#format:
#[label]: [list of prerequites] 
#	commands to execute when [label] called...

all: clean functions.o $(TARGET).o
	$(CC) $(CFLAGS) -o ./bin/$(LINKED_BINARY) ./bin/$(TARGET).o ./bin/functions.o


$(TARGET).o: $(TARGET).c
	$(CC) $(CFLAGS) -o ./bin/$(TARGET).o -c $(TARGET).c

functions.o: functions.c functions.h
	$(CC) $(CFLAGS) -o ./bin/functions.o -c functions.c


# set up clean bin folder
clean:
	mkdir ./bin -p; rm ./bin/* -f
#	rmdir ./bin; mkdir ./bin
