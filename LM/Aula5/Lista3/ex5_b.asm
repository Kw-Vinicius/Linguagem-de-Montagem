;--------------------------------------------------------------------------------------------

;5. Converta os programas em Linguagem C abaixo para Assembly. Considere que as
;variáveis utilizadas possam ser definidas em Assembly com bytes. Confira se o resultado
;apresentado é equivalente, variando as entradas em ambos os programas.

; Vinicius Atsushi Sato

; Programa b)

;--------------------------------------------------------------------------------------------

SECTION .data

    a : db 11
    result: db 0
    cont: db 1
SECTION .text
    global _start 
    _start:

    mov al,[a]
    mov cl,[cont]

    
loop:

    cmp cl,5
    jbe menor_igual_5 

    cmp cl,10
    jae maior_igual_10

    add byte [result],1
return:
    inc cl
    cmp cl,al
    jbe loop 

    jmp fim

menor_igual_5:
    add byte [result],3
    jmp return

maior_igual_10:
    cmp cl,15
    jbe menor_igual_15

menor_igual_15:
    add byte [result],2
    jmp return

fim:
    mov bl,[result]
    mov eax,1
    int 80h