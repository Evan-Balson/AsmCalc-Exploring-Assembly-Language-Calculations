global main
extern printf			;ask to include printf function

SECTION .data
	msg db "Hello, Evan",0xa,0x0


SECTION .text

main:
	push msg		; push memory location of prompt onto stack
	call printf		; call printf function
	mov eax, 1		; call for system exit
	int 0x80		; call operating system
