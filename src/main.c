#include "Libraries/libscratch.h"

typedef struct File {
    size_t size;
    char* name;
    char* content;
} File;
typedef struct Directory {
    size_t size;
    char* name;
    struct File *Files;
    struct Directory *father;
    struct Directory *Directorys;
} Directory;

int main(){
    init_memory();

    Directory root;
    root.father=NULL;
    root.name="root";

    while (true){
        Directory actual = root;

        char* buffer;
        printf(":", 0);
        scanf(buffer);
        if(IsEqual(buffer, "exit"))break;
        if(IsEqual(buffer, "ls")){
            char* test = "Hola Mn";
            append(&test, " Hola");
            printf(test, 1);
        }
    }

    return 0;
}