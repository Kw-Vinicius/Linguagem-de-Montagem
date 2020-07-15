;--------------------------------------------------------------------------------------------

;7. Faça um programa que inverta um frase. O programa deve tomar como entrada uma
;“string” contendo um frase e deve exibir a frase invertida. Por exemplo, para a entrada
;“ Isto é uma frase de teste ” deve ser exibida a saída “ teste de frase uma é Isto ”. Considere
;que a string de entrada tem um espaço no início e no fim da frase.

; Vinicius Atsushi Sato

;--------------------------------------------------------------------------------------------


SECTION .data

    msg: db ' Isto e uma frase de teste '
    len  equ  $ -msg-1                      ; mesma coisa que dizer len equ 27

    cont: db 0

SECTION .text

    global _start
    _start:

    mov ebx,len
    mov edx,0

    ; O loop: irá inverter todos os caracteres da string de lugar, trocando o 1º com o ultimo elemento, 2º com penultimo, etc
loop:
    dec ebx
    inc edx

    mov al,[msg+ebx]
    mov cl,[msg+edx]
    xchg al,cl 

    mov [msg+ebx],al 
    mov [msg+edx],cl
    
    cmp ebx,edx
    ja loop

;----------------------------------------------------------------

;Acabando este loop a frase ficara: ' etset ed esarf amu e otsI '
;Agora é preciso inverter o conteudo de cada palavra separadamente


    ;Zerando ebx, edx que vão percorrer novamente a string

    xor ebx,ebx
    mov edx,ebx

loop_inverte_palavras:

    mov al,[msg+ebx]                ;al recebe [msg+ebx], no primeiro momento ebx = 0 então al recebe primeira 'casa' da string
    cmp al,' '                      ;Se o caractere armazenad em al for um espaço então da um jump para teste
    je teste

    inc ebx                         
    ; Se o caractere em al não era espaço então só incrementa ebx e testa se a string nao acabou para voltar para o loop

    cmp ebx,len                     ;Se ebx = tamanho da string sai do loop e vai para jmp fim
    jbe loop_inverte_palavras

    jmp fim


teste:
    add byte[cont],1                

    cmp byte[cont],1                ;Se cont  = 1 então o ebx q percorre a string achou um "1º" espaço 
    je caso1                        ;Achou o primeiro espaço, ou seja , o inicio de uma palavra vai para caso1

    cmp byte[cont],2
    je caso2
caso1:
    mov edx,ebx                     ;edx recebe o valor de ebx,ou seja, o endereço do inicio da palavra atual
    inc ebx                         ;continua percorrrendo a string com ebx
    jmp loop_inverte_palavras       ;volta para o inicio do loop

caso2:                              ;Se entrou no caso 2, então achou o "2º" espaço, ou seja o fim de uma palavra da string
    mov al,[msg+ebx]                ;As proximas linhas de código invertem as letras da palavras da seguinte forma:
    mov cl,[msg+edx]                ;ultima letra -> swap <- primeira letra, penultima letra -> swap <-segunda letra,etc
    xchg al,cl                      ;faz esse processo enquanto ebx maior que edx, ou seja, percorre até o meio da palavra

    mov [msg+ebx],al 
    mov [msg+edx],cl 
    inc edx
    dec ebx
    cmp ebx,edx
    ja caso2

    mov byte[cont],0                ;Se acabou de inverter a palavra , zera o contador de espaços e volta para o loop inverte palavras
    jmp loop_inverte_palavras


;----------------------------------------------------------------

fim:

    ;Configurações para printar a mensagem
    mov eax,4
    mov ebx,1
    mov ecx,msg 
    mov edx,len+1
    int 80h

    ;Encerrando o programa

    mov eax,1
    int 80h


;----------------------------------------------------------------