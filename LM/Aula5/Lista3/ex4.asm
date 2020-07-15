;--------------------------------------------------------------------------------------------

; Sequência de Fibonacci

; Vinicius Atsushi Sato

;--------------------------------------------------------------------------------------------


SECTION .data

    var : db 5

SECTION .text

    global _start
    _start:


    mov al,[var]
    mov bl,1
    mov cl,1
    

    cmp al,1
    je caso_1

    cmp al,0
    je caso_0

  
loop:
    mov dl,cl
    add cl,bl
    mov bl,dl

    dec al 
    cmp al,1
    ja loop 

    mov bl,cl 
    jmp fim


caso_1:
    mov bl,1
    jmp fim

caso_0:
    mov bl,0

fim:
    mov eax,1
    int 80h