; **********************************************************
; Exemplo de Resolução de Expressões
; **********************************************************

 ; R = F + A * E - D * B
 ; A=10; B=8; D=1; E=3; F=2; R=
        SECTION .data
            A: db 10
            B: db 8
            D: db 1
            E: db 3
            F: db 2

        SECTION .text
            global _start
            _start:
            mov al,[D]
            mov bl,[B]
            mul bl
            mov dx,ax

            mov al,[A]
            mov bl,[E]
            mul bl

            add ax,[F]
            sub ax,dx
            mov ebx,eax
            mov eax,1              ; exit command to kernel
            int 0x80               ; interrupt 80 hex, call kernel