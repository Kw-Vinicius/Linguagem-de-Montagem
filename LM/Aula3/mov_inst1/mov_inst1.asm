	SECTION .data
;charA: db 'A',10 		; Aloca memória por byte para o char A e uma quebra de linha
charA: db 0x41, 0Ah		; Aloca memória por byte para o char A e uma quebra de linha
; charA: db 0x41; 0ah		; Aloca memória por byte para o char A e uma quebra de linha
; charA: db 65,10    		; Aloca memória por byte para o char A e uma quebra de linha
charB: db 10,'B',10,10 		; Aloca 3 quebras de linhas e um char "B" separados em 4 bytes;

	SECTION .text 		; Seção de código


	global _start
	_start:
		mov edx,2	;tamanho da string a ser printada(charA)
		mov ebx,1	;Comando para escrever na tela(saída para tela)
		mov ecx,charA	;Endereço de charA vai para ecx para que seu conteúdo seja printado.
		mov eax,4	;Comando de saída para o sistema em int 0x80
		int 0x80	;interrupt 80 hex, chama o kernel

		mov edx,4	;tamanho da string a ser printada(charB)
 		mov ebx,1	;Comando para escrever na tela(Saída para tela)
		mov ecx,charB	;Endereço de charB vai para ecx para que seu conteúdo seja printado.
		mov eax,4	;Comando de saída para o sistema em int 0x80
		int 0x80	;interrupt 80 hex, chama o kernel

		mov eax,1	;Comando de fim(final do programa) para o kernel
		int 0x80	;interrupt 80 hex, chama o kernel
