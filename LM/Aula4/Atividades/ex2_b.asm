; b.) X = H ­- B *(-­D) + (­-C) * G + A

SECTION .data
    A :  db 1
    B :  db 2
    C :  db 3
    D :  db 4
    G :  db 7
    H :  db 8


SECTION .text
    global _start

    _start:

        mov al,[B]      ;al = B
        mov bl,[D]      ;bl = D
        mul bl          ;ax = al * bl
        add ax,[H]      ;ax = ax + H
        add ax,[A]      ;ax = ax + A
        mov dx,ax       ;dx = ax((B*D) + H + A)

        mov al,[C]      ;al = C
        mov bl,[G]      ;bl = G
        mul bl          ;ax = C*G

        sub ax,dx       ; eax = (C*G) - ((B*D) + H + A)
        not eax         ; invertendo bit a bit de eax
        inc eax         ; incrementa 1 em eax  
        ;Valor de eax foi transformado em negativo
        mov ebx,eax
        mov eax,1
        int 80h
