#include <stdio.h>
//#include <conio.h>
#include <curses.h>
int main() {
    while(1) {
        char c = getch();
        putchar(c);
    }
    return 0;
}
