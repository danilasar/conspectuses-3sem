global _start
section .data           ; секция данных
message1 db "Hello, world!",10,0
message2 db "My name is Aboba)))",10,0

section .text           ; объявление секции кода
_start:
    mov rsi, message1
    mov rdx, 14
    call print

    mov rsi, message2
    mov rdx, 21
    call print

    call quit
    ret
print:
    mov rax, 1          ; системный вызов write
    mov rdi, 1          ; дескриптор stdout (1)
    syscall             ; делаем системный вызов
    ret
quit:
    mov rax, 60         ; системный вызов exit
    mov rdi, 0          ; код возврата 0
    syscall             ; делаем системный вызов
    ret
