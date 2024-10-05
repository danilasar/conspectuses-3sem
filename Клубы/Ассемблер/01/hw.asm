global _start           ; делаем метку метку _start видимой извне

section .data           ; секция данных
message:                ; указывает на букву H из следующей строки:
db "Hello, world!",1

section .text           ; объявление секции кода
_start:                 ; метка _start - адрес точки входа
mov rax, 1              ; системный вызов write
mov rdi, 1              ; дескриптор stdout (1)
mov rsi, message        ; адрес начала строки
mov rdx, 13             ; количество байт в ней
syscall                 ; делаем системный вызов
mov rax, 60             ; системный вызов exit
mov rdi, 0              ; код возврата 0
syscall                 ; делаем системный вызов