;--------------------------------------------------------------------------------------------

;3. Escreva um programa em Assembly que: inicialize duas posições de memória com
;conteúdo bytes, rótulos “base” e “expo” e retorne o resultado de base expo
;a.) Utilizando apenas somas
;b.) Utilizando multiplicações

; Vinicius Atsushi Sato

; a) Somas
;--------------------------------------------------------------------------------------------


SECTION .data
    base: db 5
    exp : db 3
    result: db 0
  
SECTION .text

global _start
    _start:

    mov al,[base]
    mov cl,[base]
    mov bl,[exp]

    dec bl
    

    multiplicacao:
        add [result],cl
        dec al
        cmp al,0
        jne multiplicacao



    mov cl,[result]
    dec bl
    mov al,[base]
    dec al
    cmp bl,0
    jne multiplicacao



    fim:
    mov bl,[result]
    mov eax,1
    int 80h

        
