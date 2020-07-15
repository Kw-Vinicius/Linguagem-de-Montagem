;   2.) Um determinado parâmetro x somente é válido for igual a zero ou estiver dentro de dois
;   intervalos pré­definidos. Por exemplo, entre 50 e 100 ou entre 150 e 200.
;   Escreva um programa em Assembly capaz de verificar se o parâmetro x tem um valor
;   válido.

; Vinicius Atsushi Sato Kawai

SECTION .data
    valor_x: db 51
    op1: db 'Válido  ',10
    op2: db 'Inválido',10  ;len = 10

SECTION .text
    global _start
    _start:

        mov al,[valor_x]            ; al recebe valor_x = 51
        cmp al,0                    ; compara al com 0
        je valido                   ; Se al for igual a 0 dá um jump para valido

        cmp al,50                   ; compara al com 50
        ja maior_50                 ; Se al for maior (above) que 50 da um jump para maior_50

        cmp al,150                  ; compara al com 150
        ja maior_150                ; Se al maior (above) que 150 da um jump para maior_150

        mov ecx,op2                 ; Se não entrou em nenhuma das comparações o valor de x é invalido, então ecx recebe a mensagem 'Invalido'
        jmp fim                     ; Pula as condicionais e vai para fim

    valido:                         ; Se for valido ecx recebe a mensagem 'Valido' e pula para o fim
        mov ecx,op1
        jmp fim
    
    maior_50:                       ; Se for maior que 50 compara al com 100
        cmp al,100                  ; Se al for menor (below) que 100 então é valido pois  100 > x > 50
        jb valido                   ; Pula para valido
    
    maior_150:                      ; Se for maior que 150 compara al com 200 
        cmp al,200                  ; Se al for menor (below) que 200 então é valido pois  200 > x > 150
        jb valido                   ; Pula para valido
    
    fim:
        mov eax,4               ; Configurando para printar na tela
        mov ebx,1
        mov edx,10              ; Move o tamanho das strings = 10
        int 80h                 ; Chama interrupção do sistema

        mov eax,1               ;Encerrando o programa
        int 80h
