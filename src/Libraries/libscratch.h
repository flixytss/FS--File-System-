#pragma once

#define NULL            ((void*)0)
#define true            1
#define false           0
typedef unsigned long long size_t;

void printf(const char* buffer, int newline);
void init_memory(void);
void* malloc(unsigned long size);
char* IntToChar(long n);
long scanf(char* buffer);
void CharToInt(char *buffer, int *out);
unsigned long strlen(const char* str);
void* memcpy(void* ptr, void** to, size_t size);
void* realloc(void* ptr, size_t size);
void free(void* ptr);
int IsEqual(char* a, char* b);
void append(char** a, char* b);