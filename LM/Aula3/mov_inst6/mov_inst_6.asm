;##########################################################
;	Exigindo um digito numérico  na tela
;		Utilizando a sintaxe []
;##########################################################


	SECTION .data		;  Seção para declaração de dados e incialização de memória.
char:	db 'X'			;  String para printar.


	SECTION .text		;  Seção de código

global _start

_start:

	mov	eax,4	;Eax vale 4
	
       ;add	eax,0x30
	add	eax,48	;Eax vale 52 (4+48)=52, 52 = Código ASCII do nº 4

	mov	[char],eax	;Substitui conteúdo de char pelo Código ASCII do nº4 

	mov	edx,1
	mov	ebx,1
	mov	ecx,char
	mov	eax,4
	int	0x80

	mov	ebx,0
	mov	eax,1
	int	0x80
