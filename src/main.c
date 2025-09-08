#include "Libraries/libscratch.h"

int main(){
    init_memory();

    int* block = (int*)malloc(2*sizeof(int));
    block[0]=54;
    block[1]=45;

    int* blocka = (int*)malloc(4*sizeof(int));

    memcpy(block, (void**)&blocka, 3*sizeof(int));

    return 0;
}