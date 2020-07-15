
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
    N: db 3,4,3

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

    sub dl,cl            ; cl = 50 - 69 = -19

    and dl,[sinal]    
    mov al,2
    mul dl

    ; o valor 1 ou 0 está em ah agora

    mov ecx,msg 
    add ecx,9
    add ah,'0'
    mov [ecx],ah


    mov ecx,msg          ; Printando a mensagem
    mov eax,4
    mov ebx,1
    mov edx,11
    int 80h

    ; Retornar 0 para reprovado ou 1 para aprovado
    mov ecx,[msg+9]
    sub ecx,'0'
    mov ebx,ecx
    
    mov eax,1           ; Encerrando o programa
    int 80h



