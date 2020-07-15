
SECTION .data
    var:  db 1,1,1,1
   
SECTION .text
    global _start

    _start:

    xor edx,edx

    mov eax,var                 ; Move o conteudo de var[0] para eax
    add edx,[eax]               ; Adiciona ao edx o conteudo de eax (1)
    inc eax                     ; Incrementa um ao endereço de eax, indo para o var[1]
    add byte [eax],1            ; Faz o var[1] receber o valor 2
    add edx,[eax]               ; Adiciona ao edx o conteudo de eax (2)
    inc eax                     ; Incrementa um ao endereço de eax, indo para o var[2] 
    add byte [eax],3            ; Faz o var[2] receber o valor 4
    add edx,[eax]               ; Adiciona ao edx o conteudo de eax (4)
    inc eax                     ; Incrementa um ao endereço de eax, indo para o var[3] 
    add byte [eax],7            ; Faz o var[3] receber o valor 8
    add  edx,[eax]              ; Adiciona ao conteudo de edx o valor de eax (8)

    mov ebx,edx                 ; Move o edx que contem a soma de todos os valores do vetor para o retorno do SO

    mov eax,1
    int 80h