global main                ; Declare the main function as the entry point of the program
extern printf              ; Declare the printf function from the C library

SECTION .data
    computer_science dd 98  ; Define a double-word variable computer_science and initialize it with the value 98
    cyber_security dd 49    ; Define a double-word variable cyber_security and initialize it with the value 49
    software_engineering dd 43 ; Define a double-word variable software_engineering and initialize it with the value 43
    web_design dd 15        ; Define a double-word variable web_design and initialize it with the value 15
    msg db "Total students in all computing programs: %d",0xa,0x0 ; Define a string msg with a newline and null terminator

SECTION .text              ; Code section starts here (calculating the sum)
main:
    mov eax, [computer_science] ; Move the value of computer_science into eax
    mov ebx, [cyber_security]    ; Move the value of cyber_security into ebx
    add eax, ebx                 ; Add ebx to eax (result in eax)

    mov ecx, [software_engineering] ; Move the value of software_engineering into ecx
    add eax, ecx                 ; Add ecx to eax (result in eax)

    mov edx, [web_design]       ; Move the value of web_design into edx
    add eax, edx                 ; Add edx to eax (result in eax)

    push eax                     ; Push the total sum onto the stack
    push msg                     ; Push the address of msg onto the stack
    call printf                  ; Call printf to print the message with the total sum
    int 0x80                      ; Make the system call to print the message

    jmp exit                     ; Jump to the label exit

exit:
    mov eax, 1                   ; Set the system call number for exit
    int 0x80                      ; Make the system call to exit the program
