#include <stdio.h>
#include "operations.h"
int main() {
    int operand1;
    int operand2;
    int operation;
    char continuation = 'y';
    int res;
    printf("Welcome to the Calculator program.\n");
    printf("Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift\n");
    while (continuation != 'n') {
        printf("\nEnter number: ");
        scanf("%d", &operand1);
        printf("Enter second number: ");
        scanf("%d", &operand2);
        printf("Select operation: ");
        scanf("%d", &operation);
        if (operation == 1) {
            res = add(operand1, operand2);
        } else if (operation == 2) {
            res = subtract(operand1, operand2);
        } else if (operation == 3) {
            res = multiply(operand1, operand2);
        } else if (operation == 4) {
            res = divide(operand1, operand2);
        } else if (operation == 5) {
            res = and(operand1, operand2);
        } else if (operation == 6) {
            res = or(operand1, operand2);
        } else if (operation == 7) {
            res = xor(operand1, operand2);
        } else if (operation == 8) {
            res = lshift(operand1, operand2);
        } else if (operation == 9) {
            res = rshift(operand1, operand2);
        }
        printf("Result: ");
        if (operation >= 1 && operation <= 9) {
            printf("%d", res);
        }
        else {
            printf("Invalid Operation ");
        }
        printf("\nContinue (y/n)?: " );
        scanf(" %c", &continuation);
    }
    printf("\nExiting");
    return 0;
}
