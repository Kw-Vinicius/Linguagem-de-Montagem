;###############################################
;	Exemplo de definições múltiplas
;###############################################


	SECTION .data	;Seção de declaração de dados e alocação de memória

LINE_BREAK	EQU	10	;Variável constante "LINE BREAK" atribuida com o valor de um /n
chx:	TIMES	2	DB	'X',LINE_BREAK		;Inicialização com alocação de bytes para a variável chx 2 vezes seguidas na memória, utilizando a constante LINE_BREAK
chz:			DB	'Z',LINE_BREAK		;Inicialização com alocação de bytes para a variável chz utilizando a constante LINE_BREAK

	SECTION .text		;Seção de código

global _start

_start:
	mov	ebx,1		;Comando de escrita para a tela
	mov	eax,4		;Saída para o sistema em int 80 hex
	mov	edx,2		;Tamanho da string a ser printada em bytes
	mov	ecx,chx		;ecx recebe o endereço de memória do primeiro byte da string chx
       ;mov	ecx,CHX		;Causa erro, nomes de dados são case sensitive(upper-low)
	int 	0x80		;interrupt 80 hex, chama o kernel

	mov	ebx,1		;Comando de escrita para a tela
	mov	eax,4		;Saída para o sistema em int 80 hex
	mov	edx,4		;Tamanho da string a ser printada em bytes
	add	ecx,2		;Adiciona 2 Bytes ao endereço de memória armazenado em ecx
	int	0x80		;interrupt 80 hex, chama o kernel

	mov	ebx,1		;Comando de escrita para a tela
	mov	eax,4		;Saída para o sistema em int 80 hex
	mov	edx,2		;Tamanho da string a ser printada em bytes
	add	ecx,2		;Adiciona 2 Bytes ao endereço de memória armazenado em ecx
	int 	0x80		;interrupt 80 hex, chama o kernel

	mov	ebx,0		;Código de retorno ao sistema(0 = normal), Fim de execução
	mov	eax,1		;Comando de saída(final de execução) para o kernel	
	int	0x80		;interrupt 80 hex, chama o kernel
