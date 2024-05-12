global main
extern printf

SECTION .data
	msg db "Hello, I'm Evan. Nice to meet you!",0xa,0x0	; create message variable
	cs_students equ 200	;declare a constant and store the value 200

SECTION .text
main:
	push msg		; push variable message onto stack
	call printf		; call print function
	mov eax, 1		; set system call to exit
	int 0x80		; call the operating system
