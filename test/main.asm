%include "../include/io.inc"

extern print_int
extern scan_int
extern print_char
extern scan_char
extern print_string
extern scan_string
extern newline

global _start

SECTION .data
msg db "Ingrese un numero:",10,0

SECTION .bss
buffer resb 64

SECTION .text

_start:

    mov eax, msg
    call print_string

    call scan_int
    call print_int
    call newline

    mov al, 'A'
    call print_char
    call newline

    mov eax,1
    xor ebx,ebx
    int 0x80
