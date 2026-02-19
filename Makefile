CC=hcc

SRC=src/main.hc

BUILD_DIR=build

TARGET=$(BUILD_DIR)/holyEval

.PHONY: clean

all: $(TARGET)

$(TARGET):
	mkdir -p $(BUILD_DIR)
	$(CC) -o $@ $(SRC)

clean:
	$(RM) -r $(BUILD_DIR)


