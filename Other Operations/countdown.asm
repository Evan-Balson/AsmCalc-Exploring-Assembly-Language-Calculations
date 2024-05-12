global main
extern printf

SECTION .data
	A dd 10
	msg db "%d",0xa,0x0


SECTION .text

main:
	mov ebx, [A]
LOOP:
	push ebx
	push msg
	call printf
	pop ecx			;clear msg from the stack
	pop ecx			;clear ebx from stack
	dec ebx			;decrement ebx
	jz END
	jmp LOOP

END:
	push ebx
	push msg
	call printf
	mov eax, 1
	int 0x80
