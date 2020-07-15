SECTION .data
    var: db 7Fh       ; 01111111

SECTION .text
    global _start

    _start:
        mov eax,[var]           ; eax recebe conteudo de var
        not eax                 ; inverte bit a bit de eax
        inc eax                 ; incrementa eax

        mov ebx,eax
        mov eax,1
        int 80h
