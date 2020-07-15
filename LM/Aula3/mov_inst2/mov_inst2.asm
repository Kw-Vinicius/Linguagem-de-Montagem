;############################################
;	Endereçamento em caracteres:
;   	   Incrementando Endereços.
;############################################

	SECTION .data	;Seção de declaração de dados(inicialização de memória com valores)

 char:	db 'ASSEMBLY'	;String alocada em 'char' para ser printada posteriormente, cada char da string ocupa um byte.


	SECTION	.text	;Seção para a escrita de código

	global _start
	
	_start:
		mov edx,1	;Tamanho da string a ser printada(apenas uma letra, 1 byte)
		mov ebx,1	;Comando de escrita para a tela
		mov ecx,char	;ecx recebe o endereço de memória do primeiro byte da string char
		mov eax,4	;Saída para o sistema em int 80 hex
		int 0x80	;interrupt 80 hex, chama o kernel

		mov edx,1	;Tamanho da string a ser printada(apenas uma letra, 1 byte)
		mov ebx,1	;Comando de escrita para a tela
	 	mov ecx,char	;ecx recebe o endereço de memória do primeiro byte da string char
		add ecx,1	;Adiciona um byte ao endereço de memória presente em ecx
		mov eax,4	;Saída para o sistema em int 80 hex
		int 0x80	;interrupt 80 hex, chama o kernel

		mov eax,1	;Comando de fim(final do programa) para o kernel
		int 0x80	;interrupt 80 hex, chama o kernel
