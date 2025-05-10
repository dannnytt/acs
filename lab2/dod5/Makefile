TARGET = signal_handler
CXX = g++

BIN_DIR = bin
SRC_DIR = src

all: $(BIN_DIR)/$(TARGET)

$(BIN_DIR)/% : $(SRC_DIR)/%.cpp
	$(CXX) -o $@ $<

.PHONY: all, clean

clean:
	rm -rf $(BIN_DIR)/*


