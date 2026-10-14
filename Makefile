# Compiler settings
CC = gcc
# Added -fno-asynchronous-unwind-tables to strip out confusing call-frame metadata,
# making the raw assembly code significantly easier for a human to read.
CFLAGS = -Wall -Wextra -O2 -Iinclude -fno-asynchronous-unwind-tables

# Target executable name
TARGET = cli_calc

# Directories
SRC_DIR = src
OBJ_DIR = obj
ASM_DIR = asm

# Find all source files and map them to object and assembly files
SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))
ASMS = $(patsubst $(SRC_DIR)/%.c, $(ASM_DIR)/%.s, $(SRCS))

# Default build rule
all: $(OBJ_DIR) $(ASM_DIR) $(TARGET) $(ASMS)

# Link the executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ -lm

# Compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Generate Intel-syntax assembly file from source files
$(ASM_DIR)/%.s: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -S -masm=intel $< -o $@

# Create directories if they don't exist
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(ASM_DIR):
	mkdir -p $(ASM_DIR)

# Clean build artifacts
clean:
	rm -rf $(OBJ_DIR) $(ASM_DIR) $(TARGET)

# Declare non-file targets
.PHONY: all clean
