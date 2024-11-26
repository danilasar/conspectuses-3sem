.model small
.stack 100h

.data
    ; Фамилия и номер группы
    info db "Tolstov Robert 251$"
    
    ; Массив чисел от 1 до 10
    numbers db 2, 4, 6, 8, 10, 1, 3, 5, 7, 9

    ; Формат вывода (для удобства) — отступ для чисел
    space db "  $"

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
    mov ah, 02h
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    
    ; Выводим массив чисел 2x5
    call PrintArray

    ; Завершаем программу
    mov ah, 4Ch
    int 21h

; Процедура для вывода массива чисел в виде таблицы 2x5
PrintArray proc
    ; Первый ряд чисел (числа с индексами 0-4)
    lea si, numbers
    call PrintRow

    ; Переход на новую строку
    mov ah, 02h
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h

    ; Второй ряд чисел (числа с индексами 5-9)
    lea si, numbers+5
    call PrintRow

    ret
PrintArray endp

; Процедура для вывода одного ряда чисел
PrintRow proc
    ; Цикл вывода 5 чисел с правильными отступами
    mov cx, 5          ; Цикл на 5 элементов
PrintLoop:
    ; Загружаем число из массива
    mov al, [si]
    ; Выводим число с отступом
    call PrintNum
    ; Переход к следующему числу
    inc si
    ; Печатаем пробел между числами
    mov ah, 02h
    mov dl, 09h ; табуляция
    int 21h
    loop PrintLoop
    ret
PrintRow endp

; Процедура для вывода числа в виде строки
PrintNum proc
    mov bl, 10
    ; Если число меньше 10, просто выводим его как символ
    cmp al, bl
    jl PrintSingleDigit

    xor ah, ah ; обнуляем ah

    ; Если число двухзначное (например 10), выводим его как два символа
    ; Разделяем на десятки и единицы
    div bl             ; AX / 10 -> AL = остаток (единицы), AH = десятки
    mov bh, ah
    
    ; Выводим десятки
    add al, '0'        ; Преобразуем в символ
    mov dl, al
    mov ah, 02h
    int 21h         ; Выводим десятки

    ;xor al, al
    
    ; Выводим единицы
    add bh, '0'        ; Преобразуем в символ
    mov dl, bh
    mov ah, 02h
    int 21h         ; Выводим единицы
    
    ret

PrintSingleDigit:
    mov bl, al
    xor al, al
    cmp cx, 5
    jz PrintSingleDigitWithoutSpace
    mov ah, 02h
    mov dl, ' '
    int 21h

PrintSingleDigitWithoutSpace:
    ; Если число одноцифровое (менее 10), выводим его как символ
    add bl, '0'        ; Преобразуем в символ
    mov dl, bl
    mov ah, 02h
    int 21h
    ret
PrintNum endp

end main
