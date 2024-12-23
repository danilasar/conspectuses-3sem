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

mov AH, 05h            ;код прерывания для установки выводимой страницы
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
            add DI, 2                ;перемещение курсора в позицию следующего символа
        loop columns
        add DI, 144                  ;смещение на новую строку на 30 столбец
        pop CX                       ;достаём значение номера строки
        inc AL                       ;получения кода следующего символа
        inc AH                       ;код следующего оформления
    loop rows
    popa                             ;восстанавливаем регистры
    ret                              ;восстановление ip на следующую за вызовом процедуры команды
cout endp           
end start