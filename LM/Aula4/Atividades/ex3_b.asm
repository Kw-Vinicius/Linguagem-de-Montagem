SECTION .data
    var: db 7Fh       ; 01111111
    inverte: db 0xFF     ; -1

SECTION .text
    global _start

    _start:
        mov ax,[var]            ;ax recebe conteudo de var
        mov bx,[inverte]        ;bx recebe conteudo de inverte
        imul bx                 ; multiplica ax com bx levando em consideração o sinal

        mov ebx,eax
        mov eax,1
        int 80h