global main
extern printf

SECTION .data
	A dd 20
	B dd 4
	msg db "20 / 4 =  %d",0xa,0x0

SECTION .text
main:
	mov eax, [A]
	xor edx, edx
	mov ebx, [B]
	div ebx		;divide eax by the value in ebx. store in eax
	push eax
	push msg
	call printf
	mov esp, 8
	jmp exit

exit:
	mov eax, 1
	int 0x80
