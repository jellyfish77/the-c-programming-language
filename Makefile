# If make is run, same outcome as make all
.DEFAULT_GOAL := all

BIN_DIR = bin
SRC_DIR = src
LIB_DIR = lib

# all: executable1 executable2
# Define make as Phony target - i.e. run even if file named "make" exists
.PHONY: make

libs: 
	cd lib && $(MAKE)

all: libs	
	$(info creating bin directories...)	
	mkdir -p bin/ch1
	mkdir -p bin/ch5
	mkdir -p bin/ch8
	$(info building...)
	cd src/ch1 && $(MAKE)			
	cd src/ch5 && $(MAKE)			
	cd src/ch8 && $(MAKE)		
	$(info linking...)
	$(CC) $(CFLAGS) -o $(BIN_DIR)/ch1/1.1.13 $(SRC_DIR)/ch1/1.1.13.o $(LIB_DIR)/functions.a
	$(CC) $(CFLAGS) -o $(BIN_DIR)/ch5/pointers $(SRC_DIR)/ch5/pointers.o
	$(CC) $(CFLAGS) -o $(BIN_DIR)/ch8/8.2.1 $(SRC_DIR)/ch8/8.2.1.o
	$(CC) $(CFLAGS) -o $(BIN_DIR)/ch8/8.2.2 $(SRC_DIR)/ch8/8.2.2.o
	$(CC) $(CFLAGS) -o $(BIN_DIR)/ch8/ternary_operators $(SRC_DIR)/ch8/ternary_operators.o
	$(CC) $(CFLAGS) -o $(BIN_DIR)/ch8/variable_args $(SRC_DIR)/ch8/variable_args.o
	
clean:    	
	cd lib && $(MAKE) clean
	cd src/ch1 && $(MAKE) clean
	cd src/ch5 && $(MAKE) clean
	cd src/ch8 && $(MAKE) clean
	rm -rf ./$(BIN_DIR)
	
	