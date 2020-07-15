;--------------------------------------------------------------------------------------------

;2. Escreva um programa em Assembly que receba como entrada um parâmetro P (definido
;com a diretiva DB) calcule o valor X = P! ­- (P + (P­-1) + (P­-2) + ... + 1). Teste com P no
;intervalo [1..5] e confira os resultados.

; Vinicius Atsushi Sato

;--------------------------------------------------------------------------------------------

SECTION .data
    P: db 5

SECTION .text
global _start
    _start:

        mov cl,[P]
        mov dl,cl
    
    loop:
        mov al,dl
        dec cl
        mov bl,cl
        mul bl
        mov dl,al
        cmp cl,1
        jne loop        

        ; Se não entrou no loop acima então acabou o fatorial e  dl = 5!

        mov cl,[P]      ; Inicio da soma de 5+4+3+2+1, cl recebendo 5
        xor bl,bl       ; Zerando bl que ira armazenar o resultado da soma

    return2:
        cmp cl,1
        jne loop2
        add bl,1
        jmp fim
    
    loop2:
        add bl,cl
        dec cl
        jmp return2

    ; Neste ponto dl = 5! = 120 / bl = 5+4+3+2+1 = 15

    fim:
        sub dl,bl
        mov bl,dl
        mov eax,1
        int 80h

