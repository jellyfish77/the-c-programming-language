CC = gcc

CFLAGS  = -ggdb -Wall -O0 -g

# this will allow you to print any variable from the shell:
# e.g. print-SOURCES
print-%  : ; @echo $* = $($*)

# Use the shell find command to get the source tree
SOURCES := $(shell find * -type f -name "*.c")
# Keep the source tree into the objects tree
LIBS := $(SOURCES:.c=.a)

# If make is run, same outcome as make all
.DEFAULT_GOAL := all

# Define make as Phony target - i.e. run even if file named "all" exists
.PHONY: all
all: $(LIBS)

#build all object files from c files
%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

# Define clean as Phony target - i.e. run even if file named "clean" exists
.PHONY: clean
clean: 
	$(info Removing all object files...)
	rm -rf *.o