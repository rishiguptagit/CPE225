#include <stdio.h>
int main() {
    printf("Enter word: ");
    while ( != '\n'){
        char word[20];
        int i;
        int j;
        int ch;
        for (i = 0; i < 19; i++) {
            ch = getchar();
            if (ch == '\n') {
                word[i] = '\0';
                break;
            }
            word[i] = ch;
        }
        printf("Original Word: ");
        printf("%s", word);
        char temp;
        i = 0;
        while (word[i + 1] != '\0'){
            j = i + 1;
            while (word[j] != '\0'){
                if (word[i] > word[j]){
                    temp = word[i];
                    word[i] = word[j];
                    word[j] = temp;
                }
                j += 1;
            }
            i += 1;
        }
        printf("\nAlphabetized Word: ");
        printf("%s", word);
        printf("\nEnter word: ");
    }
    printf("Exiting");
    return 0;
}