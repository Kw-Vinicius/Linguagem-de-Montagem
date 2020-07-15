;-------------------------------------------------------
;		Exemplo de Moves Ambíguos
;------------------------------------------------------
	SECTION .data			;Seção de dados

valor:	db	15

	SECTION .text			;Seção de texto

global _start

_start:

	mov [valor],20			;erro, Operação não especificada
	mov [valor], BYTE 20		;ok
	mov BYTE [valor], 20		;ok


	mov ebx,[valor]

	mov	eax,1
	int 	0x80
