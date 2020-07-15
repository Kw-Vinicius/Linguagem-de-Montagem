;***************************
; Exemplos de SUB e AND
;***************************

        SECTION .data
    
    var1: db 7fh    ; 01111111
    var2: db 40h    ; 01000000


        SECTION .text
    
    global _start

    _start:

        xor eax,eax
        mov eax,[var1]
        sub eax,[var2]

        ;xor eax,eax
        ;mov eax,[var1]
        ;and eax,[var2]
        ;dec eax

        mov ebx,eax
        mov eax,1           ; exit command to kernel
        int 0x80            ; interrupt 80 hex, call kernel