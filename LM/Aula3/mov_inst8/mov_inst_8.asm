;#################################################################
;	Exemplo da instrução XCHG (EXCHANGE)
;#################################################################

	SECTION .data	;Seção de dados

univ	DB	'UNESP',0AH		;Definição e alocação da string

	SECTION .text

	global _start

_start :

	mov	eax,4
	mov	ebx,1
	mov	edx,univ
	mov	ecx,6
	xchg	ecx,edx
	int	0x80

	mov	ebx,0
	mov	eax,1
	int	0x80
