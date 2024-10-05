global main

extern time
extern srand
extern rand
extern scanf
extern printf
extern getchar

section .data
    phrase1    db "ASSEMBLER", 0
    phrase2    db "ABOBA", 0
    phrase3    db "AHUMSTER", 0
    phrase4    db "ASCUM", 0
    phrase5    db "MAMMOTH", 0
    array      dq phrase1, phrase2, phrase3, phrase4, phrase5
    array_size equ ($-array) / 8
    num_format db 10, "%d", 10, 0
    char_format db "%c", 0
    newline     db 0x0A

section .bss
    selected_word        resq 1
    selected_word_len    resb 1
    input_char_buf       resb 1
    wrote_word           resb 0x100


section .text
    main:
        sub rsp, 8

        call generate_task
        
;        mov rcx, [selected_word_index]
;        mov rdi, qword [8 * rcx + array]
        input_loop:
            mov rdi, wrote_word
            call printf
            sub rsp, 8
            call input_char
            mov rdi, 0
            call try_find_char
            add rsp, 8
            jmp input_loop

        add rsp, 8
        ret
    get_random_index:
        mov  rdi, 0 ; NULL
        call time   ; rax = &time(NULL)
        mov rdi, rax ; rdi = rax
        xor rax, rax
        call srand  ; srand(time(NULL))
        call rand  ; rand()
        mov rcx, array_size
        div rcx
        mov rax, rdx
        xor rdx, rdx
        ret
    get_word_len:
        mov rdi, [selected_word] ; загружаем адрес строки
        mov rsi, rdi ; копируем адрес в rsi
        mov rax, 0  ; код символа для поиска --- конец строки
        mov rcx, -1 ; максимальное число
        repne scasb ; ищем байт
        sub rdi, [selected_word] ; получаем индекс следующего за концом строки байта
        dec rdi ; выполняя декремент, находим длину строки
        mov rax, rdi
        mov [selected_word_len], al
        ret
    generate_task:
        call get_random_index
        mov rax, qword [8 * rax + array]
        mov qword [selected_word], rax ; сохраняем адрес строки
        xor rax, rax

        call get_word_len

        movzx rbx, byte [selected_word_len]
        mov rcx, rbx ; регистр-счётчик содержит в себе длину строки
        underscore_spawner_loop:
            mov byte [(wrote_word - 1) + 1 * rcx], 0x5F ; _
            loop underscore_spawner_loop
;        mov byte [rbx + wrote_word], 0x0A ; перенос строки
;        mov byte [rbx + (wrote_word + 1)], 0 ; конец строки
        mov byte [rbx + wrote_word], 0 ; конец строки
        ret
    input_char:
;        mov rax, 0
;        mov rdi, 0
;        mov rsi, input_char_buf
;        mov rdx, 1
;        syscall
        ;call getchar
        ;mov byte [input_char_buf], al
        mov rdi, char_format
        mov rsi, input_char_buf
        call scanf
        flush_standart_import:
            call getchar
            cmp al, byte [newline]
            jnz flush_standart_import
        ret
    try_find_char:
        mov rcx, rdi
        mov rdi, num_format
        mov rsi, rcx
        call printf
        mov rdi, rcx

        xor rax, rax
        mov al, [input_char_buf]
        movzx rcx, byte [selected_word_len]
        sub rcx, rdi
        add rdi, [selected_word]
        repne scasb ; ищем байт
        jz char_found
            mov rax, 0
            ret
        char_found:
            sub rdi, [selected_word]
            dec rdi
            mov al, [input_char_buf]
            mov byte [wrote_word + rdi], al
;            mov rsi, rdi
;            mov rdi, num_format
;            call printf
;            ret
            inc rdi
            jmp try_find_char
            sub rsp, 8
            call try_find_char
            add rsp, 8
            mov rax, 1
        ret
