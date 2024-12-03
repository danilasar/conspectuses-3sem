#import "conf.typ" : conf
#show: conf.with(
  title: [Лабораторная работа №5],
  type: "referat",
  info: (
      author: (
        name: [Григорьева Данилы Евгеньевича],
        faculty: [КНиИТ],
        group: "251",
        sex: "female"
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

#align(left)[= Текст задания]  

#v(0.35cm)
// = Текст задания
/ Вариант 5 : Изображение показано на рисунке 5.8. и состоит из 5 строк символов начиная с символа C (ASCII 43h) и далее по алфавиту с разными атрибутами начиная с 0Ah и далее плюс один.  В каждой строке по 8 символов, начальная позиция вывода 20:30. Надо выполнить задание, используя прямую работу с видеопамятью:
#align(center)[#image("sections/task.png", width: 85%)]
#text(size: 12pt, align(center)[Рис. 5.8])

#align(left)[= Алгоритм программы] 
#v(0.5cm)

#align(center)[#image("sections/alg.png", width: 95%)]

#align(left)[= Текст программы на языке ассемблера с комментариями]  

```nasm
.model small
.stack 100h
.186
.data

symb db 43h            ;стройка с кодом первого символа С
symbcolors db 0Ah      ;строка с цветом и фоном символа

.code
start:
mov AX, @data 
mov DS, AX

mov AX, 0b800h         ;используем сегментные регистр ES
mov es, AX             ;для организации записи данных в видеопамять по адресу B800:0000h

mov AH, 00h            ;запрос на установку видеорежима
mov AL, 03h            ;стандартный цветовой текстовый режим
int 10h                ;вызов прерывания

mov AH, 05h            ;код прерыв. для установки выводимой стр-цы
mov AL, 00h            ;первая страница
int 10h                ;вызов прерывания

call cout
mov AX, 4C00h
int 21h

cout proc              ;процедура вывода символов на экран
    pusha              ;сохраняем регистры в стек
    mov AL, symb       ;в AL выводимый символ
    mov AH, symbcolors ;в AH оформление символа
    mov DI, 3260       ;в DI смещение 20 row 30 colummn 
    mov CX, 5          ;кол-во строк

    rows:              ;цикл для перемещения по строкам
        push CX        ;сохраняем в стеке кол-во строк
        mov CX, 8      ;кол-во столбцов
        columns:       ;цикл вывода символов в строке
            mov ES: word ptr[Di], AX ;операнд размером в слово
            add DI, 2                ;перемещение курсора в 
                                     ;позицию следующего символа
        loop columns
        add DI, 144                  ;смещение на новую 
                                     ;строку на 30 столбец
        pop CX                       ;достаём знач. номера строки
        inc AL                       ;получение кода след. символа
        inc AH                       ;код след. оформления
    loop rows
    popa                             ;восстанавливаем регистры
    ret                              ;восстановление ip на 
                                     ;следующую за вызовом 
                                     ;процедуры команды
cout endp           
end start
```

#align(left)[= Скриншот запуска программы]  
#v(0.5cm)
#align(center)[#image("sections/cout.png", width: 95%)]



// #align(left)[= Задание №3.2]

// #include "sections/task2.typ"
#pagebreak()

#align(left)[= Ответы на контрольные вопросы]
#v(0.3cm)

#include "sections/questions.typ"

