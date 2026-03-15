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

    mov ecx, eax
    xor edx, edx

.loop:
    cmp byte [ecx], 0
    je .print

    inc ecx
    inc edx
    jmp .loop

.print:
    mov ecx, eax
    mov eax, 4
    mov ebx, 1
    int 0x80

    mov esp, ebp
    pop ebp
    ret
