; ################################################################
;	Exemplo das diretivas EQU e %assign
; ################################################################

	SECTION .data		;Seção para declaração de dados e inicialização de memória
NUM_OF_ROWS	EQU	4	;Declara variável constante NUM_OF_ROWS com o número 4
NUM_OF_COLS	EQU	3	;Declara variável constante NUM_OF_COLS com o número 3
ARRAY_SIZE	EQU	NUM_OF_ROWS * NUM_OF_COLS ;Declara variável constante ARRAY_SIZE com o resultado da multiplicação das variáveis anteriores

%assign		SIZE	2	;Declara variável mutável case sensitive SIZE com valor 2
%iassign	valor	3	;Declara variável mutável sem case sensitive "valor" com valor 2


	SECTION .text		;Seção de código

global _start

_start:
;mov 		ebx,ARRAY_SIZE

%assign 	SIZE 10	;Redefine variável mutável case sensitive SIZE com valor 10
%assign 	SIZE 20	;Redefine variável mutável case sensitive SIZE com valor 20
mov 		ebx,SIZE ;Passa o valor da variável SIZE para ebx para que o valor retorne ao sistema

%iassign 	VaLoR 4 ;Redefine variável mutável sem case sensitive "valor" com valor 4
;mov 		ebx,vAlOR ; Passa o valor da variável "valor" para ebx para que este retorne ao system
mov 		eax,1 ; Comando de final(saída) para o kernel
int 		0x80 ; interrupt 80 hex, chama o kernel

