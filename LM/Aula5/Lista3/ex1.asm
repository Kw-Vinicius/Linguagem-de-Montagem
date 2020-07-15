;--------------------------------------------------------------------------------------------

; 1. Escreva um programa que inicialize três posições de memória com valores numéricos
;(<128), e retorne o menor dentre eles.

; Vinicius Atsushi Sato Kawai

;--------------------------------------------------------------------------------------------

SECTION .data
  
    var1: db 6
    var2: db 7
    var3: db 5

SECTION .text

global _start
    _start:
    
    mov al, [var1]
    mov bl, [var2]

    cmp al,bl
    ja a_maior_b

    mov bl,[var3]
    cmp al,bl
    ja var1_maior_var3

    mov bl,al
    jmp fim

    var1_maior_var3:
        mov bl,bl
        jmp fim

    a_maior_b:
        mov al,[var3]
        cmp al,bl
        ja var3_maior_b

    var3_maior_b:
        mov bl,bl
        jmp fim


    fim:
    mov eax,1
    int 80h
