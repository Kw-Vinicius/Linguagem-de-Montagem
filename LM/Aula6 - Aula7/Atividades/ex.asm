;--------------------------------------------------------------------------------------------

;Implemente um programa em Assembly NASM utilizando macros que 
;ordene um vetor de 11 posições e retorne o valor da mediana do array

; Vinicius Atsushi Sato

;--------------------------------------------------------------------------------------------

SECTION .data

    vetor: db 10,6,3,5,9,2,4,1,0,7,8

    len_vetor equ $-vetor     ; len_vetor = 11

    flag: db 0

SECTION .text

    %macro swap 0
        mov dl,[vetor+ebx+1]
        mov [vetor+ebx+1],al 
        mov [vetor+ebx],dl
        mov byte[flag],1            ;Avisa que ocorreu uma troca de valores no vetor, ou seja , continua testando o vetor
    %endmacro

    global _start
    _start:
inicio:
    mov byte[flag],0
    xor ebx,ebx
loop_ordena:

    mov al,[vetor+ebx]
    cmp al,[vetor+ebx+1]
    jb not_swap

    ;Se entrar aqui o elemento atual do vetor e maior que o seguinte, necessário chamar o swap

    swap  ; Faz a troca do elemento atual apontando por al = [vetor+ebx] com o elemento seguinte [vetor+ebx+1]

not_swap:
    inc ebx
    cmp ebx,len_vetor-1
    jb loop_ordena

    cmp byte[flag],0
    jne inicio



mediana:
    mov eax,len_vetor
    mov ebx,2

    div ebx

    mov ebx,[vetor+eax+edx] ; S0 recebe conteudo de vetor deslocado + eax + edx, (eax = parte inteira de 11/2 = 5)  (edx = resto = 1)
fim:
    mov eax,1
    int 80h


