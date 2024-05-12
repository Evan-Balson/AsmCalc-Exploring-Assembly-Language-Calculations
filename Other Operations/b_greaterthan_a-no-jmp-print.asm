global main
extern printf

SECTION .data
	A dd 250
	B dd 280
	msg db "%d is the largest",0xa,0x0

SECTION .text

main:
	mov eax, [A]
	mov ebx, [B]
	cmp eax, ebx
	jnle GREATER
	push ebx

GREATER:
	push eax
PRINT:
	push msg
	call printf
	mov eax, 1
	int 0x80
