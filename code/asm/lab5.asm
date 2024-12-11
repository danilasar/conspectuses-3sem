.model small
.stack 100h
.186
.data

symb db 'F'            ;строка с кодом первого символа F
symbcolors db 0Ah      ;строка с цветом и фоном символа

.code
start:
    mov AX, @data 
    mov DS, AX

    call InitVideo

    call GetParams

    call PrintAlphabet    ; Выводим текст
    mov AX, 4C00h
    int 21h

; Инициализирует видеорежим
InitVideo proc 
    push ax
    mov ax, 0b800h         ;используем сегментные регистр ES
    mov es, ax             ;для организации записи данных в видеопамять по адресу B800:0000h

    mov ah, 00h            ;запрос на установку видеорежима
    mov al, 03h            ;стандартный цветовой текстовый режим
    int 10h                ;вызов прерывания

    mov ah, 05h            ;код прерыв. для установки выводимой стр-цы
    mov al, 00h            ;первая страница
    int 10h                ;вызов прерывания
    pop ax
    ret
InitVideo endp

; возвращает в ax свойства символа, устанавливает позицию курсора
GetParams proc 
    mov di, 1610          ; Устанвливаем курсор в стартовую позицию
    mov al, symb          ; в AL выводимый символ
    mov ah, symbcolors    ; в AH оформление символа
    ret
GetParams endp

; Функция печати алфавита принимает в AX оформление:символ и выводит его и 5 следующих по 10 раз, выделяя каждому отделюную строку и новый цвет
PrintAlphabet proc              ;процедура вывода символов на экран
    push ax 
    push di 
    push cx
    mov cx, 5          ;кол-во строк
    rows:              ;цикл для перемещения по строкам
        push CX        ;сохраняем в стеке кол-во строк
        mov CX, 10      ;кол-во столбцов
        columns:       ;цикл вывода символов в строке
            mov ES: word ptr[Di], AX ; операнд размером в слово
            add DI, 2                ; перемещение курсора в позицию следующего символа
            loop columns
        add di, 140                  ; смещение на строку
        pop CX                       ; достаём знач. номера строки
        inc AL                       ; получение кода след. символа
        inc AH                       ; код след. оформления
        loop rows
    pop cx 
    pop di 
    pop ax
    ret
PrintAlphabet endp           
end start
