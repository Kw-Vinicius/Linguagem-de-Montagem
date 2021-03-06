; **********************************************************
; Exemplo de AND, NOT
; **********************************************************

 SECTION .data              ; data section

 var16b: DW 0xFF
 varmask: DW 0x10

 SECTION .text              ; code section

 global _start
 _start:
 mov ax,[var16b] ;11111111
 and ax,[varmask] ;00010000
 not ax
 inc ax

 ;mov ax,0
 ;sub ax,[varmask]

 mov ebx,eax
 mov eax,1          ; exit command to kernel
 int 0x80           ; interrupt 80 hex, call kernel