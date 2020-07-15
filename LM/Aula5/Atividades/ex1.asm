;   1.) Escreva um programa em Assembly que determine a possibilidade ou obrigatoriedade
;   de voto de acordo com a idade do eleitor:
;   idade<16 O cidadão não pode votar!
;   Idade>=16 ou idade>=70 O voto é facultativo.
;   Idade>=18 e idade<70 O cidadão é obrigado a votar.

; Vinicius Atsushi Sato Kawai

SECTION .data
    idade: db 71                                                ;idade aleatória escolhida
    op1: db 'O cidadão não pode votar!    ',10                  ; len = 32
    op2: db 'O voto é facultativo.         ',10
    op3: db 'O cidadão é obrigado a votar.',10

SECTION .text           

    global _start
    _start:

        mov al,[idade]                                          ;al recebe conteudo de idade
        cmp al,16                                               ;comparando al com 16
        jb menor_16                                             ;Se for menor(jump below) que 16 então da um jump para 'menor_16', caso contrário continua o código

        cmp al,18                                               ;compara al com 18   
        jb  facutativo                                          ; Se al menor que 18 vai para facutativo, como ja foi testado menor que 16 não tem perigo de cair em caso de menor de 16 anos podendo votar

        cmp al,70                                               ;comparando al com 70
        ja facutativo                                           ; Se al maior que 70 também é facutativo

        mov ecx,op3                                             ; Se não é maior que 70 ou menor que 18, só restou ser entre 70 e 18, ou seja, obrigatório o voto
        jmp fim                                                 ; Vai direto pro fim para nao entrar nas condicionais    

    menor_16:                                                   
        mov ecx,op1                                             ; Entrou na condição menor que 16, ecx recebe msg 'Não pode votar'                                     
        jmp fim                                                 ; Vai direto pro fim para nao entrar nas condicionais  

    facutativo:                                                 ; OU idade>70  OU 16>= idade < 18
        mov ecx,op2                                             ; Move para ecx a msg 'Voto facutativo'
        jmp fim                                                 ; Vai direto pro fim para nao entrar nas condicionais  

 
    fim:

        mov edx,32                                              ;Move o tamanho das strings  = 32    
        mov eax,4                                               ;Configurando para printar na tela
        mov ebx,1                                               ;Configurando para printar na tela
        int 80h                                                 ;Chama a interrupção

        mov eax,1                                               ;Encerra o programa
        int 80h                                                 ;Encerra o programa





