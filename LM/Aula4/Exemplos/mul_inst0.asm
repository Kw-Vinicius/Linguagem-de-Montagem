; **********************************************************
;       Exemplo de Multiplicação
; **********************************************************

 SECTION .data
 var1: db 10h
 var2: db 10

 SECTION .text ; code section

 global _start

 _start:

 mov ax,[var1]
 mov bx,[var2]
 mul bx
 mov ebx,eax

 mov eax,1              ; exit command to kernel
 int 0x80               ; interrupt 80 hex, call kernel