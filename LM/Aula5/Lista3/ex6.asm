;--------------------------------------------------------------------------------------------

;6. Escreva um programa que inicialize 10 posições de memórias com caracteres em
;maiúsculo, ordene­os em ordem alfabética e exiba na tela o conteúdo do vetor.

; Vinicius Atsushi Sato

;--------------------------------------------------------------------------------------------

SECTION .data

    vetor: db 'JIHGFEDCBA'

    flag: db 0

SECTION .text

    global _start 
    _start:
inicio:
    mov ebx,0
    mov byte[flag],0
loop:
    mov al,[vetor+ebx]
    cmp al,[vetor+ebx+1]
    jb not_swap 

    ; se entrou aqui , então deve trocar o elemento atual com o proximo
    mov dl,[vetor+ebx+1]
    mov [vetor+ebx+1],al 
    mov [vetor+ebx],dl
    mov byte[flag],1

not_swap:                   ; entra no not_swap então só incrementa o ebx que percorre o vetor e continua testando
    inc ebx
    cmp ebx,9
    jb loop

    cmp byte[flag],0
    jne inicio

fim: 

    mov eax,4
    mov ebx,1
    mov edx,10
    mov ecx,vetor 
    int 80h

    mov eax,1
    int 80h


