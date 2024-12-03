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
```

#align(left)[= Скриншот запуска программы]  

#align(center)[#image("cout.png", width: 95%)]



// #align(left)[= Задание №3.2]

// #include "sections/task2.typ"
#pagebreak()

#align(left)[= Ответы на контрольные вопросы]
#v(0.3cm)

#include "sections/questions.typ"

