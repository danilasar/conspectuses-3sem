#import "conf.typ" : conf
#show: conf.with(
  title: [Лабораторная работа №4],
  type: "referat",
  info: (
      author: (
        name: [Григорьева Данилы Евгеньевича],
        faculty: [КНиИТ],
        group: "251",
        sex: "male"
      ),
      inspector: (
        degree: "Старший преподаватель",
        name: "Е. М. Черноусова"
      )
  ),
  settings: (
    title_page: (
      enabled: true
    ),
    contents_page: (
      enabled: true
    )
  )
)

#align(left)[= Задание]  

#v(0.35cm)
// = Текст задания
/ Вариант 5 : Массив из 20 чисел заполнить последовательностью, состоящей наполовину из чисел кратных 3 и наполовину из квадратов этих чисел; организовать вывод массива на экран в виде таблицы 2x10 с фиксированной шириной столбцов.
//#align(center)[#image("sections/mas.png", width: 60%)]
//#text(size: 12pt, align(center)[Рис.1 Вывод в виде таблицы 2x10 массива из 20 чисел.])

#align(left)[= Алгоритм]

+ Вывод фамилии и номера группы
+ Вывод массива
 + Вывод первой строки (обход 0-9 индексов)
  + Вывод числа
    + Приведение к цифре и сохранение в стеке
    + Извлечение цифры из стека, её приведение к символу и вывод на экран
 + Вывод второй строки (обход 10-19 индексов)
   + Аналогично выводу первой строки
+ Завершение работы программы

#align(left)[= Исходный код]  

```nasm
.model small
.stack 100h

NUMBERS_COUNT = 10
NUMBER_SIZE   = 2
COLUMN_WIDTH  = 5

.data
    ; Фамилия и номер группы
    info db "Grigorev Danya 251$"
    ; Массив чисел
    numbers db 2 dup (NUMBER_SIZE * NUMBERS_COUNT dup (?))

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
    ; Генерируем массив
    call GenerateArray
    ; Выводим массив чисел
    call PrintArray
    ; Завершаем программу
    mov ah, 4Ch
    int 21h

GenerateArray proc 
    mov bx, 10
    lea ax, numbers
    call GenerateTwos
    lea ax, numbers + NUMBER_SIZE * NUMBERS_COUNT
    call GenerateThrees
    ret
GenerateArray endp

; Генерирует bx первых степеней двойки и кладёт их в массив с началом в [ax]
GenerateTwos proc
    push si 
    push cx
    push dx
    mov si, ax
    mov cx, bx
    mov dx, 2
    generateTwo:
        mov [si], dx
        sal dx, 1
        add si, NUMBER_SIZE
        loop generateTwo
    pop dx
    pop cx
    pop si
    ret
GenerateTwos endp

; Генерирует bx первых степеней тройки и кладёт их в массив с началом в [ax]
GenerateThrees proc
    push ax
    push bx
    push cx
    push dx
    push si 
    mov si, ax
    mov cx, bx
    mov ax, 3
    mov bx, 3
    generateThree:
        mov [si], ax
        mul bx
        add si, NUMBER_SIZE
        loop generateThree
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
GenerateThrees endp

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
    lea si, numbers + NUMBER_SIZE * NUMBERS_COUNT
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
    ; Цикл вывода чисел с правильными отступами
    mov cx, NUMBERS_COUNT ; Количество элементов
    PrintLoop:
        ; Загружаем число из массива
        mov ax, [si]
        ; Выводим число с отступом
        call PrintNum
        ; Переход к следующему числу
        add si, NUMBER_SIZE
        mov dx, 1
        cmp dx, cx
        jz continuePrintLoop
        ; Печатаем пробел между числами
        mov ah, 02h
        mov dl, 09h ; табуляция
        ;mov dl, '_' ; табуляция
        int 21h
        continuePrintLoop:
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

    ; Вывод ведущих пробелов
    push cx
    mov dx, COLUMN_WIDTH
    sub dx, cx
    jna start_printing
    mov cx, dx
    spacing:    
        mov ah, 02h
        mov dl, ' '
        int 21h
        loop spacing

    ; Вывод непосредственно числа
    start_printing:
    pop cx
    printing:
        pop bx
        call PrintSingleDigit
    loop printing

    pop dx
    pop cx
    pop bx
    pop ax
    ret


PrintSingleDigit proc
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
```

#align(left)[= Скриншот запуска программы]  

#align(center)[#image("cout.png", width: 95%)]



// #align(left)[= Задание №3.2]

// #include "sections/task2.typ"
#pagebreak()

#align(left)[= Ответы на контрольные вопросы]
#v(0.3cm)

#include "sections/questions.typ"

