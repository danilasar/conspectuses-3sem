.model small
.stack 100h

.data 
Names db 'Grigorev Danya 251', 0Dh, 0Ah, '$'

.386 ; разрешаем транслировать команды процессорам 386
.code

start:
mov AX, @data ;помещение указателя на сенгмент данных в AX
mov DS, AX ;помещение указателя на сенгмент данных в DS

mov DX, offset Names ;помещение ссылки на строку с именем в dx
mov AH, 09h ;код команды прерывания для вывода строки
int 21h ;команда прерывания

mov EAX, 65536 ;занесение в AX числа 65536
mov EBX, 10 ;занесение в BX делителя
mov CX, 0;обнуление счётчика

loop_first: ; заносим в стек
inc CX ;увеличение счётчика
mov EDX, 0 ;очищение значения DX
div EBX ;деление AX на BX
push EDX ;занесение остатка от деление в стек
cmp EAX, 0 ;сравнение частного с нулем
jne loop_first ;если AX != 0, то возвращаемся к loop_first

mov AH, 02h ;код прерывания для вывода единичного вывода

loop_second: ;2я метка, дост содерж стека + cout
pop EDX ;команда прерывания для зав-ния прог-мы
call cout ;команда прерывания
loop loop_second

mov EAX, 4C00h
int 21h

cout proc ;вывод на экран одной цифры
add EDX, 30h ;c помощью табл ASCII получаем цифру
int 21h ;возврат к основной программе
ret ;конец процедуры
cout endp

end start
