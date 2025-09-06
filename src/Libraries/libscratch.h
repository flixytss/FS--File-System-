#pragma once

#define NULL            ((void*)0)

void printf(const char* buffer);
void init_memory(void);
void* malloc(unsigned long size);
char* IntToChar(long n);
long scanf(char* buffer);
void CharToInt(char *buffer, int *out);
char* concatstr(char** str, const char* app);
unsigned long strlen(const char* str);