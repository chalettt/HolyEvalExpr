CC=hcc

SRC=src/main.hc $(wildcard src/*/*.hc)

BUILD_DIR=build

TARGET=$(BUILD_DIR)/holyEval

.PHONY: clean

all: $(TARGET)

$(TARGET): $(SRC)
	mkdir -p $(BUILD_DIR)
	$(CC) -o $@ $<

clean:
	$(RM) -r $(BUILD_DIR)


