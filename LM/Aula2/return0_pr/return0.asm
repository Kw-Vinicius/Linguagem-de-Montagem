;###########################################
;    Primeiro Exemplo Return
;#########################################
;
; assembler:	nasm -f elf -o <program>.o <program>.asm
; linker:	ld -m elf_i386 -s -o <program> <program>.o
		SECTION .text		;seção de códigos

	global _start

	;Ponto de Entrada para o programa
	_start:
		;Final de Qualquer Programa em Assembly
		;ebx carrega o número para o S.O e eax em 1 diz que o ebx pode sair para o kernel
		mov	ebx,15
		
		mov	eax,1		;comando de saida para o kernel
		int	0x80		;interrupção 80 hex, chamada ao kernel
