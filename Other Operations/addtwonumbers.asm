global main
extern printf

SECTION .data
	A dd 20					;
	B dd 31					;
	msg db "20 + 31 = %d",0xa,0x0		;

SECTION .text

main:
	mov eax, [A]		; load a into eax register
	add eax, [B]		; add b to eax register
	push eax		; push eax onto the stack
	push msg		; push memory location onto the stack
	call printf		; call printf
	mov eax, 1		; set system call to exit
	int 0x80		; call operating system
