global main
extern printf

SECTION .data
	A dd 45
	B dd 23
	msg db "45 - 23 = %d",0xa,0x0

SECTION .text

main:
	mov eax, [A]
	sub eax, [B]
	push eax
	push msg
	call printf
	mov eax, 1
	int 0x80
