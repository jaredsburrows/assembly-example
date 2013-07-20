section .data                   ; constants stored here

    msg db "Hello World!", 0xa  ; our string to be printed
    len equ $ - msg             ; get the length of our string

section .text                   ; labels stored here

global _main                    ; specify our main function - (ld -e main)

_syscall:                       ; label - system call - call kernel - how we print to the screen
    int 0x80
    ret

_main:                          ; label - technically int main()
    push    dword len           ; message length
    push    dword msg           ; message to write
    push    dword 1             ; file descriptor - 1 - stdout
    mov     eax, 0x4            ; system call number - 4 - system write
    call    _syscall            ; go to label(function call) - _syscall

    ;  add     esp,12          ;clean stack (3 arguments * 4)

    push    dword 0             ; exit code - return 0
    mov     eax, 0x1            ; system call number (sys_exit)
    call    _syscall            ; go to label(function call) - _syscall