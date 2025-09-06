AS := nasm
GCC := gcc
AR := ar

VERSION := elf64

OBJ_DIR := build
BIN_DIR := build/bin

SRC_LIBC := src/Libraries/tools.c
SRC_ASM := src/Libraries/lowlevel.asm
SRC_MAIN := src/main.c

LIB_OBJ := $(OBJ_DIR)/libc.o $(OBJ_DIR)/libasm.o
MAIN_OBJ := $(OBJ_DIR)/fs.o
LIB := $(OBJ_DIR)/lib.a
TARGET := $(BIN_DIR)/FS

ALL_STEPS := \
	"Assembling $(SRC_ASM)" \
	"Compiling $(SRC_LIBC)" \
	"Archiving library" \
	"Compiling $(SRC_MAIN)" \
	"Linking $(TARGET)" \
	"Running $(TARGET)"

TOTAL := $(words $(ALL_STEPS))

$(OBJ_DIR) $(BIN_DIR):
	@mkdir -p $@

$(OBJ_DIR)/libasm.o: $(SRC_ASM) | $(OBJ_DIR)
	@COUNT=1; PERCENT=$$((COUNT*100/$(TOTAL))); printf "[%3d%%] Assembling $<\n" $$PERCENT; $(AS) -f$(VERSION) $< -o $@


$(OBJ_DIR)/libc.o: $(SRC_LIBC) | $(OBJ_DIR)
	@COUNT=2; PERCENT=$$((COUNT*100/$(TOTAL))); printf "[%3d%%] Compiling $<\n" $$PERCENT; $(GCC) -no-pie -c $< -o $@

$(LIB): $(LIB_OBJ)
	@COUNT=3; PERCENT=$$((COUNT*100/$(TOTAL))); printf "[%3d%%] Archiving library\n" $$PERCENT; $(AR) rcs $@ $^

$(OBJ_DIR)/fs.o: $(SRC_MAIN) | $(OBJ_DIR)
	@COUNT=4; PERCENT=$$((COUNT*100/$(TOTAL))); printf "[%3d%%] Compiling $<\n" $$PERCENT; $(GCC) -no-pie -c $< -o $@

$(TARGET): $(MAIN_OBJ) $(LIB) | $(BIN_DIR)
	@COUNT=5; PERCENT=$$((COUNT*100/$(TOTAL))); printf "[%3d%%] Linking $@\n" $$PERCENT; $(GCC) $^ -o $@ -no-pie

run: $(TARGET)
	@COUNT=6; PERCENT=$$((COUNT*100/$(TOTAL))); printf "[%3d%%] Running $@\n" $$PERCENT; ./$(TARGET)

all: clean $(TARGET) run

clean:
	@rm -rf $(OBJ_DIR) $(BIN_DIR)
	@echo "Clean done."
