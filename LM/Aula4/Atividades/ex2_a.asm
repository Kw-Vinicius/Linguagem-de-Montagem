; a.) X = A + B *C – D * F + G – H

SECTION .data
    A : db 1
    B : db 2
    C : db 3
    D : db 4
    F : db 6
    G : db 7
    H : db 8

SECTION .text
    global _start

    _start:

        mov al,[D]  ;al = D
        mov bl,[F]  ;bl = F
        mul bl      ;ax = D*F
        add ax,[H]  ;ax = ax + H
        mov dx,ax   ;dx = ax -> ax = ((D*F) + H)

        mov al,[B]  ;al = B
        mov bl,[C]  ;bl = C
        mul bl      ;ax = B*C
        add ax,[A]  ;ax = ax + A
        add ax,[G]  ;ax = ax + G -> ax = ((B*C) + A + G)

        sub ax,dx   ;((B*C) + A + G) - ((D*F) + H)

        mov ebx,eax
        mov eax,1
        int 80h

