;hello_world.asm Programa de iniciação em nasm para linux, intel.
;
	;assembler: nasm -f elf -o <program>.o <program>.asm
 	;linker: ld -m elf_i386 -s -o <program> <program>.o
	;Execução: hello_world
	;Saída: Hello World
	
	SECTION .data 			;Seção para declaração de dados já iniciados

msg:	db  "Hello World",10		;Declaração da variável "msg" iniciada com a mensagem:
					;"Hello World"(string) e com o 10 (Quebra de linha, /n).
 
	SECTION .text			;Seção para a escrita do código em si.


	global _start			;Declarando o start

	;Entrada para o programa em si:
	_start:
	

		mov	eax,4		;Operação de saída será realizada na tela.
		mov	ebx,1		;arg1: registrador ebx recebe 1 (operação de saída a ser realizada)
		mov 	ecx,msg		;arg2: registrador ecx receber a mensagem(ponteiro para string) endereço de onde a varíavel da string está
		mov	edx,12		;arg3 - tamanho da variável a ser printada
		int	0x80		;interrupt 80 hex, chama ao kernel(S.O)
	
		mov	ebx,0		;Comando de Saída(exit), 0=Saída Normal, (operação de saída (output) )
		mov 	eax,1		;Comando de Saída para o kernel(S.O) (eax em 1, retornar valor para o S.O)
		int	0x80		;interrupt 80 hex, chama ao kernel(S.O)
