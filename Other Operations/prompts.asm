global main
extern printf

SECTION .data
    prompt db "Enter your name: ",0xa,0x0
    hello db "Hello, %s",0xa,0x0

SECTION .bss
    name resb 40

SECTION .text

main:
    push prompt         ; push prompt onto stack
    call printf         ; call printf
    pop ebx             ; clear stack
    mov eax, 3          ; set system call for read input
    mov ebx, 1          ; set input to standard input
    mov ecx, name       ; set read location to name
    mov edx, 40         ; set length of read to 40 characters
    int 0x80            ; call operating system
    push name           ; push name on stack
    push hello          ; push hello message on stack
    call printf         ; call printf
    mov eax, 1          ; set system call for exit
    int 0x80            ; call operating system


; if you enter a name greater than  40 it will be  cut to the size specified in name.
