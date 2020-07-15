;##############################################
; 	Variações diretiva DB
;##############################################


	SECTION .data	;Seção de incialização de dados e alocação de memória

depto:		DB	'DEMAC',0AH	;Aloca memória para string "DEMAC" e uma quebra de linha

unidade:	DB	'I'		;Aloca memória para string "IGCE" e uma quebra de linha
		DB	'G'		;Alocação feita de maneira distinta
		DB	'C'
		DB	'E'
		DB	0xA



	SECTION .text		;Seção de código
	
	global _start
	
	_start:
		mov ebx,1	;Comando de escrita para a tela
		mov ecx,unidade ;ecx armazena o endereço de memória do primeiro byte da string unidade
		mov eax,4	;Saída para o sistema em int 80 hex
		mov edx,5	;Tamanho da string a ser printada em bytes
		int 0x80	;interrupt 80 hex, chama o kernel
	
		mov ebx,1	;Comando de escrita para a tela
		mov ecx,depto	;ecx armazena o endereço de memória do primeiro byte da string depto
		mov eax,4	;Saída para o sistema em int 80 hex
		mov edx,6	;Tamanho da string a ser printada em bytes
		int 0x80	;interrupt 80 hex, chama o kernel

		
		mov ebx,0	;Código de retorno ao sistema(0 = normal), Fim de execução
		mov eax,1	;Comando de saída(final de execução) para o kernel
		int 0x80	;interrupt 80 hex, chama o kernel
