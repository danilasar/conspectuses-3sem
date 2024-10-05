stak segment stack 'stack'      ;Начало сегмента стека
db 256 dup (?)                  ;Резервируем 256 байт для стека
stak ends                       ;Конец сегмента стека

data segment 'data'             ;Начало сегмента данных
Hello db 'Danila Grigoriev, 251$'       ;Строка для вывода
data ends                       ;Конец сегмента данных

code segment 'code'             ;Начало сегмента кода
main proc far
    push DS
    xor AX,AX
    push AX
    ret 
main endp
code ends                       ;Конец сегмента кода
end start                       ;Конец текста программы с точкой входа
