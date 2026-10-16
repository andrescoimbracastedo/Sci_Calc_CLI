CC = gcc

CFLAGS = -Wall -Wextra -O2 -Iinclude -fno-asynchronous-unwind-tables

TARGET = cli_calc

SRC_DIR = src
OBJ_DIR = obj
ASM_DIR = asm

SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))
ASMS = $(patsubst $(SRC_DIR)/%.c, $(ASM_DIR)/%.s, $(SRCS))

all: $(OBJ_DIR) $(ASM_DIR) $(TARGET) $(ASMS)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ -lm

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(ASM_DIR)/%.s: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -S -masm=intel $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(ASM_DIR):
	mkdir -p $(ASM_DIR)

clean:
	rm -rf $(OBJ_DIR) $(ASM_DIR) $(TARGET)

.PHONY: all clean
