global main

extern scanf
extern printf

; данные секции .data записаны внутри исполняемого
; файла и выгружаются в оперативную память при загрузке.
; сюда мы складываем "переменные", которые должны быть
; инициализированы в момент запуска программы
section .data
num_format   db "%d", 0                         ; ввод числа
char_format  db " %c", 0                        ; ввод символа
out_format   db "%d %c %d = %d", 10, 0          ; вывод результата
action_error db "Недопустимая операция", 10, 0  ; если статус = 1, выведем это
status       db 0                               ; статус (по нему проверим ошибки)

; данные секции .bss не хранятся в ELF-файле.
; bss --- область оперативной памяти, в которую
; мы будем складывать те значения переменных,
; которые неизвестны на момент запуска (например, всё,
; что вводится через scanf)
; для удобства мы размечаем адреса будущих переменных,
; расставляя метки
section .bss
a            resq 1               ; число a
b            resq 1               ; число b
c            resq 1               ; результат
action       resb 1               ; знак

; содержимое секции .text хранится в ELF-файле
; и выгружается в оперативную память при загрузке
; программы. отсюда процессор берёт машинные инструкции
section .text
; функция main --- наша точка входа
main:
    sub rsp, 8                 ; выравнивание стека
    call input                 ; вызываем функцию ввода данных
    call calc                  ; вызываем функцию калькулятора
    add byte [status], 0       ; status += 0 обновит нам регистр флагов
    jnz main_finish            ; status == 0 => прыгаем к main_finish
    call output                ; выводим результат, если status != 0
main_finish:
    add rsp, 8                 ; восстанавливаем стек
    ret                        ; завершаем работу функции
    
; функция calc проверяет введённый
; символ операции и выполняет соответствующие
; вычисления
calc:
    mov rcx, [b]           ; 
    mov rdx, [a]
    mov ax, [action]
    ; проверяем сложение
    mov bx, 0x2b ; +
    cmp ax, bx   ; сравниваем
    jz calc_add  ; jz = 0 => прыгаем по метке calc_add

    ; проверяем вычитание
    mov bx, 0x2d ; -
    cmp ax, bx
    jz calc_sub
    
    ; умножение
    mov bx, 0x2a ; *
    cmp ax, bx
    jz calc_mul

    ; деление
    mov bx, 0x2f ; /
    cmp ax, bx
    jz calc_div

    ; остаток от деления
    mov bx, 0x25 ; %
    cmp ax, bx
    jz calc_mod

    ; грустный финал функции calc.
    ; проверив все операции, мы делаем вывод,
    ; что человек ввёл некорректный символ
    ; математической операции
    mov byte [status], 1       ; поэтому записываем в status 1
    lea rdi, [action_error]    ; кладём в rdi адрес action_error
    sub rsp, 8
    call printf                ; вызываем printf(action_error)
    add rsp, 8
    ret                        ; завершаем выполнение функции
; это не отдельная функция, а продолжение функции calc
; сюда мы попадём, если пользователь введёт операцию +
calc_add:
    add rdx, rcx
    jmp calc_finish
; та же история, но для знака -
calc_sub:
    sub rdx, rcx
    jmp calc_finish
; умножение
calc_mul:
    imul rcx ; rdx *= rcx
    jmp calc_finish
; деление
calc_div:
    call calc_div_mod_prepare ; функция, которая подготовит и выполнит деление
    mov rdx, rax ; кладём результат в rdx
    xor rax, rax ; восстанавливаем в ax значение action
    mov ax, [action]
    jmp calc_finish
; остаток от деления
calc_mod:
    call calc_div_mod_prepare  ; выполняем деление, остаток как раз в rdx
    xor rax, rax               ; обнулим записавшееся в rax частное
    mov ax, [action]           ; вернём в ax символ действия
    jmp calc_finish            ; и прыгнем в финал функции calc
; позитивный финал функции calc
calc_finish:
    mov qword [c], rdx
    ret

; а это уже функция, которая вызывается ниже
; в двух местах: при делении и при поиске остатка от деления
calc_div_mod_prepare:
    mov rax, rdx               ; div ожидает числитель в rax, так что rax = rdx
    xor rdx, rdx               ; по этому поводу обнуляем rdx: (rdx ^= rdx) == 0
    idiv rcx                    ; rax /= rcx, rdx = rax % rcx
    ret

; функция, которая отвечает за ввод данных
input:
    sub rsp, 8                 ; выравнивание
    ; a
    lea rdi, [num_format]      ; ссылка на строку формата %d кладём в rdi
    lea rsi, [a]           ; ссылка на переменную a в rsi
    xor rax, rax               ; 0 аргументов с плавающей точкой => обнуляем rax
    call scanf                 ; функция консольного ввода из std

    ; action
    lea rdi, [char_format]     ; ссылку на %c кладём в rdi
    lea rsi, [action]      ; ссылку на action кладём в rsi
    xor rax, rax
    call scanf

    ; c
    lea rdi, [num_format]
    lea rsi, [b]           ; число b
    xor rax, rax
    call scanf


    add rsp, 8                 ; удаляем параметры
    ret

; фукнция вывода данных
output:
    sub rsp, 8                 ; выравнивание
    lea rdi, [out_format]  ; ссылка на начало строки-формата выывода
    mov rsi, [a]           ; 2-й аргумент: значение переменной a
    mov rdx, [action]      ; 3-й аргумент: значение переменной action
    mov rcx, [b]           ; 4-й аргумент: значение переменной b
    mov r8,  [c]           ; 5-й аргумент: значение переменной c
    xor rax, rax               ; обнуляем rax, что означает отсутствие float'ов
    call printf                ; printf(out_format, a, action, b, c)
    add rsp, 8
    ret
