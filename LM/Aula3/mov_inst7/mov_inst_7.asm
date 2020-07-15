;#####################################################
;	Comparação Mov e LEA
;#####################################################



	SECTION .data		;Seção de dados
char:	db 'A'			;String a ser printada

	SECTION .text		;Seção de código


global _start

_start:


	mov	ebx,[char]	;Conteudo de char
	;mov	ebx,char	;Endereço de char
	;lea	ebx,[char]	;Endereço de char
	;lea	ebx,char	;Inválido		


	mov	eax,1
	int 	0x80
