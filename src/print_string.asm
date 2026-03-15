SECTION .text
global print_string

; ---------------------------------
; print_string
; Entrada:
;   EAX = direccion de cadena
;   cadena terminada en 0
; ---------------------------------

print_string:

    push ebp
    mov ebp, esp

    mov ecx, eax      ; ECX apunta al inicio de la cadena
    xor edx, edx      ; contador de longitud = 0

.loop:

    cmp byte [ecx], 0
    je .print

    inc ecx
    inc edx
    jmp .loop

.print:

    mov ecx, eax      ; dirección original de la cadena

    mov ebx, 1        ; stdout
    mov eax, 4        ; sys_write
    int 0x80

    mov esp, ebp
    pop ebp
    ret
