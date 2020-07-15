; **********************************************************
; Exemplo de Resolução de Expressões
; **********************************************************

 ; R = (A - B) * (D + E) - F
 ; A=10; B=8; D=1; E=3; F=2; R=6

 SECTION .data
 A: db 10
 B: db 8
 D: db 1
 E: db 3
 F: db 2

 SECTION .text          ; code section
 global _start
 _start:

 mov al,[A]
 sub al,[B]
 mov bl,[D]
 add bl,[E]
 mul bl
 mov bx,[F]
 sub ax,bx

 mov ebx,eax
 mov eax,1          ; exit command to kernel
 int 0x80           ; interrupt 80 hex, call kernel