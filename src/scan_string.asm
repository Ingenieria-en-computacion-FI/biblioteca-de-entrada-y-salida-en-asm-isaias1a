SECTION .text
global scan_string

; ---------------------------------
; scan_string
; Entrada:
;   EAX = buffer destino
;   EBX = tamaño máximo
; ---------------------------------

scan_string:

    push ebp
    mov ebp, esp

    mov ecx, eax      ; ECX = dirección del buffer
    mov edx, ebx      ; EDX = tamaño máximo

    ; syscall read
    mov eax, 3        ; sys_read
    mov ebx, 0        ; stdin
    int 0x80

    ; EAX devuelve cantidad de bytes leídos
    mov esi, eax
    dec esi           ; quitar salto de línea

    mov byte [ecx + esi], 0   ; colocar terminador NULL

    mov esp, ebp
    pop ebp
    ret
