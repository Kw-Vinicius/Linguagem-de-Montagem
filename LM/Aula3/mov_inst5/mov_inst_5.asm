;#########################################################
; Sintaxe: Diferença entre endereços e conteúdos(labels)
;#########################################################

	SECTION .data		;Seção para declaração de dados e inicialização de memória
;msg:	DB	'B'		;Aloca 1 byte para o char 'B' no endereço de 'msg'
msg: 	DB	'AD'		;Aloca 2 bytes para a string 'AD' no endereço de 'msg'



	SECTION .text		;Seção para o código
global _start


_start:
       ;mov	ebx,msg		;Move o endereço de 'msg'(1ºbyte da string) para ebx (retorna para o sistema esse endereço).
	mov	ebx,[msg]	;Move o conteúdo do endereço de 'msg' (1º byte) para ebx(retorna para o sistema esse conteúdo).

	mov	eax,1		;Comando de saída(final de execução) para o kernel
	int	0x80		;interrupt 80 hex, chama o kernel
