;--------------------------------------------------------------------------------------------

;5. Converta os programas em Linguagem C abaixo para Assembly. Considere que as
;variáveis utilizadas possam ser definidas em Assembly com bytes. Confira se o resultado
;apresentado é equivalente, variando as entradas em ambos os programas.

; Vinicius Atsushi Sato

; Programa a)

;--------------------------------------------------------------------------------------------

SECTION .data

    input_a: db 5

    input_b: db 3
    result: db 0 

SECTION .text

    global _start 
    _start:


    mov al,[input_a]
    mov bl,[input_b]
    mov cl,0

    cmp al,bl 
    jb a_menor_b

    mul bl 
    mov bl,al 
    jmp fim

a_menor_b:
    add byte [result],cl

    inc cl 
    cmp cl,al 
    jb a_menor_b

    mov bl,[result]
    jmp fim


fim:
    mov eax,1
    int 80h