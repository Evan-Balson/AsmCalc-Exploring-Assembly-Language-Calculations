global main
extern printf

SECTION .data
	A dd 280
	B dd 250
	msg db "%d is the largest.",0xa,0x0

SECTION .text

main:
	mov eax, [A]
	mov ebx, [B]
	cmp eax, ebx
	jg A_GREATER
	push ebx
	jmp PRINT
A_GREATER:
	push eax
PRINT:
	push msg
	call printf
	mov eax, 1
	int 0x80
