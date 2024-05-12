global main                 ; Declare the main function as the entry point of the program
extern printf               ; Declare the printf function from the C library
extern scanf                ; Declare the scanf function from the C library

SECTION .data
    prompt db "Enter student's Age: ", 0xa,0x0 ; Define a string prompt with a newline and null terminator
    B dd 1                    ; Define a double-word variable B and initialize it with the value 1
    C dd 2                    ; Define a double-word variable C and initialize it with the value 2
    SIMTech db "SIMTech: %d is an odd number.",0xa,0x0 ; Define a string for odd number output
    Smartstart db "Smartstart: %d is an even number.",0xa,0x0 ; Define a string for even number output
    ProTech db "ProTech: %d is a prime number.",0xa,0x0 ; Define a string for prime number output
    format_input db "%d", 0  ; Define a format string for scanf to read an integer

SECTION .bss
    A resd 1                  ; Reserve space for a double-word variable A

SECTION .text

main:
    push prompt               ; Push the address of the prompt string onto the stack
    call printf               ; Call the printf function to print the prompt
    add esp, 4                ; Adjust the stack pointer to remove the prompt address from the stack

    lea eax, [prompt]         ; Load the effective address of prompt into the eax register
    push eax                  ; Push the address of prompt onto the stack for scanf
    push dword A              ; Push the address of variable A onto the stack for scanf
    push dword format_input   ; Push the format string for scanf
    call scanf                ; Call scanf to read an integer from the user
    add esp, 12               ; Adjust the stack pointer to remove the scanf arguments from the stack

next:
    mov eax, [A]              ; Move the value of variable A into the eax register
    mov ebx, [B]              ; Move the value of variable B into the ebx register
    cmp eax, ebx              ; Compare the values of A and B
    je IS_ODDNOTPRIME         ; Jump to the label IS_ODDNOTPRIME if the comparison is equal
    mov ecx, [C]              ; Move the value of variable C into the ecx register
    cmp eax, ecx              ; Compare the values of A and C
    je IS_PRIME               ; Jump to the label IS_PRIME if the comparison is equal

EVEN_ODD:
    test eax, 1               ; Test the least significant bit of A to check if it's odd or even
    jz IS_EVEN                ; Jump to the label IS_EVEN if the result is zero (even)
    jmp check_prime           ; Jump to the label check_prime if the result is non-zero (odd)

check_prime:
    mov ecx, 2                ; Initialize a counter (divisor) to 2
    mov ebx, [A]              ; Move the value of A into the ebx register for division
loop:
    mov eax, ebx              ; Move the value of ebx into eax for division
    xor edx, edx              ; Clear the edx register to store the remainder of the division
    div ecx                   ; Divide eax by ecx, result in eax, remainder in edx
    cmp esi, 0                ; Compare the remainder with 0
    je IS_ODDNOTPRIME         ; Jump to the label IS_ODDNOTPRIME if the comparison is equal (A is odd)
    inc ecx                   ; Increment the divisor (counter)
    mov eax, ecx              ; Move the value of the counter into eax
    imul eax, eax             ; Square the counter
    cmp eax, ebx              ; Compare the squared counter with A
    jbe loop                  ; Jump back to loop if less than or equal
    mov eax, [A]              ; Move the value of A back into eax
    jmp IS_PRIME              ; Jump to the label IS_PRIME if A is greater than the squared counter

IS_PRIME:
    push eax                  ; Push the value of A onto the stack for printf
    push ProTech              ; Push the address of the prime message onto the stack
    call printf               ; Call printf to print the prime message
    pop ecx                   ; Pop the message address from the stack
    pop ecx                   ; Pop the value of A from the stack
    jmp exit                  ; Jump to the label exit

IS_ODDNOTPRIME:
    push eax                  ; Push the value of A onto the stack for printf
    push SIMTech              ; Push the address of the odd message onto the stack
    call printf               ; Call printf to print the odd message
    pop ecx                   ; Pop the message address from the stack
    pop ecx                   ; Pop the value of A from the stack
    jmp exit                  ; Jump to the label exit

IS_EVEN:
    push eax                  ; Push the value of A onto the stack for printf
    push Smartstart           ; Push the address of the even message onto the stack
    call printf               ; Call printf to print the even message
    pop ecx                   ; Pop the message address from the stack
    pop ecx                   ; Pop the value of A from the stack
    jmp exit                  ; Jump to the label exit

exit:
    mov eax, 1                ; Set the system call number for exit
    int 0x80                   ; Make the system call to exit the program
