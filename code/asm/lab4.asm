
.model small
.stack 100h

.data
    ; Фамилия и номер группы
    info db "Grigorev Danya 251$"
    
    ; Массив чисел
        numbers dw 10b, 100b, 1000b, 10000b, 100000b,
        dw 1000000b, 10000000b, 100000000b, 1000000000b, 10000000000b,
        dw 3, 9, 27, 81, 243, 729, 2187, 6561, 19683, 59049

.code
main:
    ; Инициализация сегмента данных
    mov ax, @data
    mov ds, ax
    
    ; Выводим фамилию и номер группы
    mov ah, 09h
    lea dx, info
    int 21h
    
    ; Переход на новую строку
    call NewLine
    
    ; Выводим массив чисел 2x10
    call PrintArray

    ; Завершаем программу
    mov ah, 4Ch
    int 21h

; Переход на новую строку
NewLine proc 
    push ax
    push dx
    mov ah, 02h
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    pop dx
    pop ax
    ret
NewLine endp

; Процедура для вывода массива чисел в виде таблицы 2x5
PrintArray proc
    push si
    ; Первый ряд чисел
    lea si, numbers
    call PrintRow

    ; Переход на новую строку
    call NewLine

    ; Второй ряд чисел (числа с индексами 5-9)
    lea si, numbers+20
    call PrintRow

    pop si
    ret
PrintArray endp

; Процедура для вывода одного ряда чисел
PrintRow proc
    push ax
    push cx
    push dx
    push si
    ; Цикл вывода 10 чисел с правильными отступами
    mov cx, 10          ; Цикл на 10 элементов
    PrintLoop:
        ; Загружаем число из массива
        mov ax, [si]
        ; Выводим число с отступом
        call PrintNum
        ; Переход к следующему числу
        add si, 2
        ; Печатаем пробел между числами
        mov ah, 02h
        mov dl, 09h ; табуляция
        int 21h
    loop PrintLoop
    pop si 
    pop dx
    pop cx
    pop ax
    ret
PrintRow endp

; Процедура для вывода числа в виде строки
PrintNum proc
    push ax
    push bx
    push cx
    push dx
    xor cx, cx
    mov bx, 10
    calculation:
        xor dx, dx
        div bx
        push dx
        inc cx
        cmp ax, 0
    jne calculation
    printing:
        pop bx
        call PrintSingleDigitWithoutSpace
    loop printing
    pop dx
    pop cx
    pop bx
    pop ax
    ret


PrintSingleDigitWithoutSpace:
    push ax
    push bx
    push dx
    add bl, '0'        ; Преобразуем в символ
    mov dl, bl
    mov ah, 02h
    int 21h
    pop dx
    pop bx
    pop ax
    ret
PrintNum endp

end main
