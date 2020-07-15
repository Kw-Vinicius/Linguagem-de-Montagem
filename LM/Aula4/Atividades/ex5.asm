
; ---------------------------------------------------------------------------------------------

;                               Vinicius Atsushi Sato Kawai

;5. Considere dois vetores de números inteiros P=[2,3,5] e N=[8,6,7], em que N representa
;notas de 3 avaliações e P seus respectivos pesos. Considerando média 5 como nota final
;mínima para aprovação, escreva um programa em Assembly inicialize tais vetores e:
;a.) Retorne 0, caso o aluno tenha sido reprovado e qualquer outro valor caso tenha sido
;aprovado.
;b.) Exiba “Aprovado: 1” caso o aluno tenha sido aprovado ou “Aprovado: 0” caso o aluno
;tenha sido reprovado.

; ---------------------------------------------------------------------------------------------
SECTION .data

    P: db 2,3,5
    N: db 8,6,7
    M: db 5,5,5
    msg: db 'Aprovado 1',10
    sinal: db 10000000b

    return: db  0

SECTION .text
    global _start

    _start:

    mov al, [P]
    mov bl, [N]
    mul bl 

    xor cl,cl
    add cl,al

    mov al, [P+1]
    mov bl, [N+1]
    mul bl
    
    add cl,al

    mov al, [P+2]
    mov bl, [N+2]
    mul bl
    
    add cl,al           ; cl tem 69 agora

    mov al, [M]
    mov bl, [P]
    mul bl

    xor dl,dl
    add dl,al

    mov al, [M+1]
    mov bl, [P+1]
    mul bl

    add dl,al

    mov al, [M+2]
    mov bl, [P+2]
    mul bl

    add dl,al            ; dl tem 50 agora

    sub cl,dl            ; cl = 69 -50 = 19

    and cl,[sinal]       ; compara cl com 10000000b para saber se é negativo
    mov al,cl            ; passa cl para al
    mov cl,[sinal]       ; move 10000000b para cl
    div cl               ; divide o al por 10000000b , se al for 0 a div  = 0 se al for = cl entao div = 1

    mov edx,[msg+9]      ; Pega o '1' da mensagem de aprovado
    sub edx,'0'          ; transforma o caractere '1' no numeral 1

    sub edx,eax          ; subtrai o 1 de edx com o resultado da divisao armazenado em eax , se eax = 0 , edx permanesce em 1, se eax = 1, edx vira 0

    add edx,'0'          ; Após inverter o valor de edx, transforma o numeral em caractere

    mov [msg+9],edx      ; Substituindo o caractere transformado na mensagem de 'Aprovado X'

    mov ecx,msg          ; Printando a mensagem
    mov eax,4
    mov ebx,1
    mov edx,11
    int 80h

    mov eax,[msg+9]     ; Retornando para o SO 0 se Reprovado e 1 se Aprovado
    sub eax,'0'
    mov ebx,eax
    
    mov eax,1           ; Encerrando o programa
    int 80h

