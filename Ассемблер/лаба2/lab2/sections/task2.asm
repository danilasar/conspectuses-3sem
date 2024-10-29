.model small
.stack 100h

.data 
Names db 'Grigorev Danya 251', 0Dh, 0Ah, '$'
enter db 0Dh, 0Ah, '$'

.code

start:
mov AX, @data
mov DS, AX

;адрес начала строки
mov DX, offset Names
call cout

mov AL, 7 ; занесение первой цифры в регистр AL
mov BL, 5 ; занесение второй цифры в регистр BL

push AX ; добавление AX в стек

mov DL, AL  ; переносим AL в DL, чтобы вывести символ в AL
add DL, 30h ; перевод цифры в символьную форму с помощью кода ASCII и команды ADD
call coutElem

mov DL, ' ' ; переносим AL в DL, чтобы вывести символ в AL
call coutElem

mov DL, BL  ; переносим BL в DL, чтобы вывести символ в BL
add DL, 30h ;перевод цифры в символьную форму с помощью кода ASCII и команды ADD
call coutElem

pop AX ; удаление AX из стека

XCHG AL, BL ; меняем местами AL и BL

mov DX, offset enter ;адрес начала строки
call cout

mov DL, AL  ; переносим AL в DL, чтобы вывести символ в AL
add DL, 30h ; перевод цифры в символьную форму с помощью кода ASCII и команды ADD
call coutElem

mov DL, ' ' ; переносим AL в DL, чтобы вывести символ в AL
call coutElem

mov DL, BL  ; переносим BL в DL, чтобы вывести символ в BL
add DL, 30h ; перевод цифры в символьную форму с помощью кода ASCII и команды ADD
call coutElem

mov AX,4C00h ; функция завершения программы 4Ch с кодом возврата 0
int 21h      ; вызов функции DOS

; вывод строки
cout proc
    mov AH, 09h ;Функция DOS 09h вывода на экран
    int 21h ;вызов функции DOS 09h
    ret ; возврат в точку вызова
cout endp

; вывод символа
coutElem proc
    mov AH, 02h ; номер функции вывода одного символа
    int 21h ;вызов функции 02h
    ret ; возврат в точку вызова
coutElem endp

end start


