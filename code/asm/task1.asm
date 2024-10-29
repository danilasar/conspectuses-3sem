.model small
.stack 100h

.data 
Names db 'Grigoriev Danya 251', 0Dh, 0Ah, '$'

.code

start:
mov AX, @data ;помещение указателя на сегмент данных в AX
mov DS, AX ;помещение указателя на сегмент данных в DS

;адрес начала строки
mov DX, offset Names
mov ah, 09h
int 21h

mov AX, 1488 ; занесение числа
mov BX, 10 ; занесение делителя
mov CX, 0 ; обнуляем счётчик

loop_first: ; заносим в стек цифры
inc cx ; увеличение счётчика
mov dx, 0 ; очищение значения DX
div bx ; деление AX на BX
push dx ; занесение остатка от деление в стек
cmp ax, 0 ; сравнение частного с нулем
jne loop_first ; если AX != 0, то возвращаемся к loop_first

mov ah, 02h

loop_second: ; достаём из стека
pop dx
call cout
loop loop_second

mov ax, 4C00h ; завершаем программу
int 21h

cout proc;вывод на экран одной цифры
add dx, 30h ;c помощью табл ASCII получаем цифру
int 21h ;возврат к основной программе
ret конец процедуры
cout endp

end start
