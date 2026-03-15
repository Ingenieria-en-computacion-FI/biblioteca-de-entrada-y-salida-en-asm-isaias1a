SECTION .bss
char_buffer resb 1

SECTION .text
global print_char

print_char:

    push ebp
    mov ebp, esp

    ; guardar el caracter recibido en AL
    mov [char_buffer], al

    ; llamada al sistema write
    mov eax, 4        ; sys_write
    mov ebx, 1        ; stdout
    mov ecx, char_buffer
    mov edx, 1        ; imprimir 1 byte
    int 0x80

    mov esp, ebp
    pop ebp
    ret
