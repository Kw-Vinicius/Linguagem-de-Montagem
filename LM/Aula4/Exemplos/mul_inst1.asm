; **********************************************************
; Exemplo de Multiplicação
; **********************************************************

 SECTION .data
 var1: db 10H ; 16
 var2: db 0xFF ; (-1)

 SECTION .text ; code section

 global _start
 _start:

 mov ax,[var1]
 mov bx,[var2]
 imul bx

 ; 16 * (-1) = -16
 ; 00010000 > 11101111 > 11110000

 mov ebx,eax
 mov eax,1              ; exit command to kernel
 int 0x80               ; interrupt 80 hex, call kernel