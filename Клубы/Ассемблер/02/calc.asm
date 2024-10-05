global _start

section .data


section .text
_start:
    mov rax, 60             ; системный вызов exit
    mov rdi, 0              ; код возврата 0
    syscall                 ; делаем системный вызов

