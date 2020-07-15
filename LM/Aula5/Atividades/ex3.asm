;   3.) Crie um programa em Assembly onde são definidas 3 posições de memória que
;   representam comprimentos de segmentos de reta. Verifique se os segmentos podem formar
;   um triângulo (um lado não pode ser maior que a soma dos outros dois) e retorne qual o
;   tipo de triângulo formado (equilátero, isósceles ou escaleno).

; Vinicius Atsushi Sato Kawai
SECTION .data
    reta1: db 3                 ; Valores aleatórios para os lados do triângulo
    reta2: db 3
    reta3: db 3

    op1: db 'Pode formar triângulo     ',10
    op2: db 'Não pode formar triângulo',10  ;len = 28

    t1: db 10,'Isósceles .'

    t2: db 10,'Equilatero.'      ; len = 12
    t3: db 10,'Escaleno  .'

SECTION .text
    global _start
    _start:
    
    inicia:
        mov al,[reta1]              ;al recebe reta1 = 3
        xor bl,bl                   ; zerando bl
        add bl,[reta2]              ; bl = bl + 4   (0 + 4 = 4)
        add bl,[reta3]              ; bl = bl + 5   (4 + 5 = 9)

        cmp al,bl                   ; comparando al com bl (3 com 9)
        ja invalido                 ; Se al > bl então da um jump para invalido

        mov al,[reta2]              ;al recebe reta2 = 4
        xor bl,bl                   ; zerando bl
        add bl,[reta1]              ; bl = bl + 3 (0 + 3 = 3)
        add bl,[reta3]              ; bl = bl + 5 (3 + 5 = 8)

        cmp al,bl                   ; comparando al com bl (4 com 8)
        ja invalido                 ; Se al > bl então da um jump para invalido

        mov al,[reta3]              ; al recebe reta3 = 5
        xor bl,bl                   ; zerando bl
        add bl,[reta1]              ; bl = bl + 3   (0 + 3 = 3)
        add bl,[reta2]              ; bl = bl + 4   (3 + 4 = 7)

        cmp al,bl                   ; comparando al com bl (5 com 7)
        ja invalido                 ; Se al > bl então da um jump para invalido

        mov al,[reta1]              ; Faz a comparação de lado 1 com lado 2
        mov bl,[reta2]
        mov cl,[reta3]
        cmp al,bl
        je isosceles                ; Se igual o triângulo é ou isosceles ou equilatero

        mov al,[reta1]              ; Faz a comparação de lado 1 com lado 3
        mov bl,[reta3]
        mov cl,[reta2]
        cmp al,bl
        je isosceles                ; Se igual o triângulo é ou isosceles ou equilatero

        mov al,[reta2]              ; Faz a comparação de lado 2 com lado 3
        mov bl,[reta3]
        mov cl,[reta1]
        cmp al,bl
        je isosceles                ; Se igual o triângulo é ou isosceles ou equilatero

        mov ecx,t3                  ; Se nenhum dos casos deu isosceles então ele é Escaleno
        
    return: 
        mov eax,4                   ; Entra no return e printa qual o tipo de triângulo
        mov ebx,1
        mov edx,12
        int 80h

        mov ecx,op1                 ; Se não foi invalido em nenhum dos casos entao ecx recebe mensagem 'Pode formar triângulo'
        jmp fim                     ; Da um jump para o final

    isosceles:                      ; Se ele entrou no isosceles ele compara um dos lados repetidos com o terceiro lado armazenado em cl
        cmp al,cl
        je equilatero               ; Se igual o triângulo é equilatero

        mov ecx,t1          
        jmp return

    equilatero:
        mov ecx,t2                  ; Entrou no caso de equilatero, entao manda para o ecx a mensagem 'Equilatero'
        jmp return

    invalido:
        mov ecx,op2                 ; Se algum dos casos caiu em invalido, ecx recebe mensagem 'Não pode formar triangulo'

    fim:
        mov eax,4                   ;Configurando para printar na tela
        mov ebx,1                   ;Configurando para printar na tela
        mov edx,28                  ;Move o tamanho das strings  = 28
        int 80h                     ;Chama interrupção do sistema

        mov eax,1                   ;Encerra o programa
        int 80h                     ;Encerra o programa
    