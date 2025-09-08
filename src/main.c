#include "Libraries/libscratch.h"

int main(){
    init_memory();

    int* block = (int*)malloc(2*sizeof(int));
    block[0]=54;
    block[1]=45;

    int* blocka = (int*)realloc(block, 3);
    printf("Block\n");
    printf(IntToChar(block[0]));
    printf("\n");
    printf(IntToChar(block[1]));
    printf("\nBlocka\n");
    printf(IntToChar(blocka[0]));
    printf("\n");
    printf(IntToChar(blocka[1]));
    printf("\n");
    printf(IntToChar(blocka[2]));
    printf("\n");

    return 0;
}