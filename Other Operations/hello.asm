global main

SECTION .data					;data for the program
	msg db "I wrote this code", 0xa		;Store text in variable
	len equ 17				;store the length of msg

SECTION .text

main:				;program code or body
	mov edx, len		;load the message length
	mov ecx, msg		;loag the address of the message
	mov ebx, 1		;stdout where to write the message
	mov eax, 4		;set the system call to write
	int 0x80		;call the os to perform operation
	mov eax, 1		;set the system call to exit
	int 0x80		;call the os to exit operation
