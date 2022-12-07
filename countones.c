#include <stdio.h>
int main() {
    int number;
    char cont = 'y';
    int i;
    int res;
    int one;
    printf("Welcome to the CountOnes program.\n");
    while (cont != 'n') {
        res = 0;
        one = 1;
        printf("\nPlease enter a number: ");
        scanf("%d", &number);
        for (i = 0; i < 32; i++){
            if ((number & one) == 1) {
                res ++;
            }\
            number >>= 1;
        }
        printf("The number of bits set is: %d\n", res);
        printf("Continue (y/n)?: ");
        scanf("%s", &cont);
    }
    printf("Exiting\n");
    return 0;
}