# Variable definitions
CC = gcc
CFLAGS = -g -I./inc
SRCDIR = src
BUILDDIR = build
TARGET = $(BUILDDIR)/main

# Find all .c files in the src directory
SRC = $(wildcard $(SRCDIR)/*.c)

# Main rule
all: $(TARGET)

# Rule to compile the executable
$(TARGET): $(SRC)
	@mkdir -p $(BUILDDIR)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

# Clean rule
clean:
	rm -rf $(BUILDDIR)

# PHONY targets to avoid conflicts with files with these names
.PHONY: all clean
