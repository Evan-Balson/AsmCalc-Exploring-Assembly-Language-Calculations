global main                ; Declare the main function as the entry point of the program
extern printf              ; Declare the printf function from the C library

SECTION .data
    new_stu dd 42           ; Define a double-word variable new_stu and initialize it with the value 42
    min dd 4                ; Define a double-word variable min and initialize it with the value 4
    med dd 5                ; Define a double-word variable med and initialize it with the value 5
    max dd 6                ; Define a double-word variable max and initialize it with the value 6

    msg_min db "A maximum of %d groups can be created or",0xa,0x0 ; Define a string msg_min with a newline and null terminator
    msg_med db "A median of %d can be created or",0xa,0x0        ; Define a string msg_med with a newline and null terminator
    msg_max db "A minimum of %d groups can be created",0xa,0x0   ; Define a string msg_max with a newline and null terminator

SECTION .text
main:
    call IF_MIN             ; Call the IF_MIN function
    call IF_MED             ; Call the IF_MED function
    call IF_MAX             ; Call the IF_MAX function
    jmp exit                ; Jump to the label exit

IF_MIN:
    mov eax, [new_stu]      ; Move the value of new_stu into eax
    xor edx, edx            ; Clear the edx register for division
    mov ebx, [min]          ; Move the value of min into ebx
    div ebx                 ; Divide eax by ebx, result in eax, remainder in edx
    push eax                ; Push the result of the division (number of groups) onto the stack
    push msg_min            ; Push the address of msg_min onto the stack
    call printf             ; Call printf to print the message with the result
    add esp, 8              ; Adjust the stack pointer to remove the arguments from the stack
    ret                     ; Return from the function

IF_MED:
    mov eax, [new_stu]      ; Move the value of new_stu into eax
    xor edx, edx            ; Clear the edx register for division
    mov ebx, [med]          ; Move the value of med into ebx
    div ebx                 ; Divide eax by ebx, result in eax, remainder in edx
    push eax                ; Push the result of the division (number of groups) onto the stack
    push msg_med            ; Push the address of msg_med onto the stack
    call printf             ; Call printf to print the message with the result
    add esp, 8              ; Adjust the stack pointer to remove the arguments from the stack
    ret                     ; Return from the function

IF_MAX:
    mov eax, [new_stu]      ; Move the value of new_stu into eax
    xor edx, edx            ; Clear the edx register for division
    mov ebx, [max]          ; Move the value of max into ebx
    div ebx                 ; Divide eax by ebx, result in eax, remainder in edx
    push eax                ; Push the result of the division (number of groups) onto the stack
    push msg_max            ; Push the address of msg_max onto the stack
    call printf             ; Call printf to print the message with the result
    add esp, 8              ; Adjust the stack pointer to remove the arguments from the stack
    ret                     ; Return from the function

exit:
    mov eax, 1              ; Set the system call number for exit
    int 0x80                ; Make the system call to exit the program
