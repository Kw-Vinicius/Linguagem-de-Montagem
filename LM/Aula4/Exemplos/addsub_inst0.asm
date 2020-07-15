
 ; **********************************************************
 ; Exemplo de expressões com ADD e SUB
 ; R = 9 - (-9) + 5 + (-10)
 ; **********************************************************

 SECTION .data ; data section
 var1: db 9
 var2: db 0xF7
 var3: db 5
 var4: db 0xF6

 SECTION .text ; code section
 global _start
 _start:
 mov eax,[var1]
 sub eax,[var2]
 add eax,[var3]
 add eax,[var4]

 mov ebx,eax
 mov eax,1                  ; exit command to kernel
 int 0x80                   ; interrupt 80 hex, call kernel