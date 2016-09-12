section .data                   ; Constants stored here

msg: db "Hello World!", 0xa     ; our string to be printed, 0xa = 10
.len: equ $ - msg               ; get the length of our string

global start                    ; specify our main function - (ld -e main)

section .text                   ; labels stored here

start:                          ; label - technically int main()
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg.len
    syscall

    mov rax, 0x2000001
    mov rdi, 0
    syscall
