; Escreva um programa em Assembly que calcule o valor X = 5! ­- (5+4+3+2+1)

SECTION .data
    var: db 5
    cont : db 0
SECTION .text
    global _start

    _start:
     
      mov eax,[var]
      add [cont],eax    ;cont = 0+5 = 5
      mov ebx,eax       ;ebx = 5
      dec eax           ;eax = 4
      add [cont],eax    ;cont = 5+ 4 = 9
      mov ecx,eax
      mul ebx

                                   ;eax = 20
                                   ;ecx = 4
    dec ecx                        ;ecx = 3
    add [cont],ecx                 ;cont = 9+3 = 12
    mov ebx,ecx                    ;ebx = 3
    mul ebx                        ;ebx * eax = 20 * 3 = 60

    dec ecx                        ;ecx = 2
    add [cont],ecx                 ;cont = 12+2 = 14
    mov ebx,ecx                    ;ebx = 2
    mul ebx                        ;ebx * eax = 2 * 60 = 120

    dec ecx                        ;ecx = 1
    add [cont],ecx                 ;cont = 14+1 = 15
    mov ebx,ecx                    ;ebx = 1
    mul ebx                        ;ebx * eax = 1*120 = 120

    sub eax,[cont]

    mov ebx,eax                    ;Retorna para o SO (5!-cont) <=> (120-15) = 105
    mov eax,1
    int 80h


; O fatorial de 5 é 120, subtraindo cont = (5+4+3+2+1) = 15
; O valor retornado para o SO é 5! - cont = 120 - 15 = 105



