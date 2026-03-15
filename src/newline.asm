extern print_char
global newline

SECTION .text

newline:

    push ebp
    mov ebp, esp

    ; cargar salto de línea en AL
    mov al, 10

    ; llamar a print_char
    call print_char

    mov esp, ebp
    pop ebp
    ret
