global main
extern printf

SECTION .data
	A dd 4
	B dd 4
	msg db "4 * 4 = %d",0xa,0x0

SECTION .text

main:
	mov eax, [A]
	mov ebx, [B]
	mul ebx
	push eax
	push msg
	call printf
	pop ecx
	pop ecx
	mov eax, 1
	int 0x80
