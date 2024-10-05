#include <stdio.h>

char* num_format = "%d";
char* char_format = " %c";
char* out_format = "%d %c %d = %d\n";

int a, b, c;
char action;

int main() {
    scanf("%d", &a);
    scanf(char_format, &action);
    scanf(num_format, &b);
    switch(action) {
        case '+':
            c = a + b;
            break;
        case '-':
            c = a - b;
            break;
        case '*':
            c = a * b;
            break;
        case '/':
            if(b == 0) {
                printf("На 0 делить нельзя\n");
                return -1;
            }
            c = a / b;
            break;
        case '%':
            if(b == 0) {
                printf("На 0 делить нельзя\n");
                return -1;
            }
            c = a % b;
            break;
        default:
            printf("Некорректная операция\n");
            return -2;
    }
    printf(out_format, a, action, b, c);
    return 0;
}
