global main                ; Declare the main function as the entry point of the program
extern printf              ; Declare the printf function from the C library

SECTION .data
    start_msg db "Web design teaching group currently has 15 students.", 0xa,0x0 ; Define a string start_msg with a newline and null terminator

    msg1_entry db "Adding 32 students to the web design teaching group...", 0xa,0x0 ; Define a string msg1_entry with a newline and null terminator
    msg1_len equ $ - msg1_entry  ; Define a variable msg1_len to represent the length of msg1_entry

    msg2 db "web design teaching group now has %d students", 0xa,0x0 ; Define a string msg2 with a newline and null terminator
    msg2_len equ $-msg2        ; Define a variable msg2_len to represent the length of msg2

    web_design_teaching_group dd 15 ; Define a double-word variable web_design_teaching_group and initialize it with the value 15
    add_student dd 32           ; Define a double-word variable add_student and initialize it with the value 32

SECTION .text

main:
    push start_msg            ; Push the address of the start_msg string onto the stack
    call printf               ; Call the printf function to print the start message
    ; The following lines use the sys_write system call to print a message directly to the console
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1_entry
    mov edx, msg1_len
    int 0x80
    jmp Addition              ; Jump to the label Addition

Addition:
    mov eax, [web_design_teaching_group] ; Move the value of web_design_teaching_group into eax
    sub eax, 0                ; Subtract 0 from eax (no effect)
    mov ebx, [add_student]    ; Move the value of add_student into ebx
    sub ebx, 0                ; Subtract 0 from ebx (no effect)
    add eax, ebx              ; Add ebx to eax
    add eax, 0                ; Add 0 to eax (no effect)

    push eax                  ; Push the updated value of eax (total number of students) onto the stack
    push msg2                 ; Push the address of msg2 onto the stack
    call printf               ; Call printf to print the second message with the updated number of students
    int 0x80                   ; Make the system call to print the message

exit:
    ; Exit program
    mov eax, 1                ; Set the system call number for exit
    xor ebx, ebx              ; Set ebx to 0 (exit code)
    int 0x80                   ; Make the system call to exit the program
