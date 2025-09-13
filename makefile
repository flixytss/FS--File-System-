AS := nasm
GCC := gcc
AR := ar

VERSION := elf64

OBJ_DIR := build
BIN_DIR := build/bin

SRC_LIBC := src/Libraries/tools.c
SRC_ASM := src/Libraries/lowlevel.asm
SRC_MAIN := src/main.c

LIB_OBJ_ASM := $(OBJ_DIR)/libasm.o
LIB_OBJ_C := ${OBJ_DIR}/libc.o
MAIN_OBJ := $(OBJ_DIR)/fs.o
LIB := $(OBJ_DIR)/libsl.a
TARGET := $(BIN_DIR)/FS

${MAIN_OBJ}:
	${GCC} -c ${SRC_MAIN} -o ${MAIN_OBJ} -no-pie
${LIB_OBJ_C}:
	${GCC} -c ${SRC_LIBC} -o ${LIB_OBJ_C} -no-pie
${LIB_OBJ_ASM}:
	${AS} -f${VERSION} ${SRC_ASM} -o ${LIB_OBJ_ASM}
${LIB}: ${LIB_OBJ_ASM} ${LIB_OBJ_C}
	${AR} rcs $@ $^
${TARGET}: ${LIB} ${MAIN_OBJ}
	${GCC} ${MAIN_OBJ} ${LIB} -o ${TARGET}

clean:
	rm -rdf build/*.o build/*.a build/bin/*
run: ${TARGET}
	./build/bin/FS
all: clean run
