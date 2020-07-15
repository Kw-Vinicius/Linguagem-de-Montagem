;--------------------------------------------------------------------------------------------

;3. Escreva um programa em Assembly que: inicialize duas posições de memória com
;conteúdo bytes, rótulos “base” e “expo” e retorne o resultado de base expo
;a.) Utilizando apenas somas
;b.) Utilizando multiplicações

; Vinicius Atsushi Sato

; b) Multiplicação

;--------------------------------------------------------------------------------------------

SECTION .data

    base: db 4
    exp: db 2

SECTION .text

global _start

    _start:

    mov al,[base]
    mov bl,[base]
    mov cl,[exp]

loop:
    mul bl
    dec cl
    cmp cl,1
    ja loop

fim:
    mov bl,al
    mov eax,1
    int 80h
    