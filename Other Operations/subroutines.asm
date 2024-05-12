global main
extern printf

SECTION .data
    printnum db "%d",0x0
    printfizz db "fizz",0x0
    printbuzz db "buzz",0x0
    endprint db 0xa,0x0
    number dd 15
    flag db 0

SECTION .text

main:
    call fizz
    call buzz
    call print
    call end

print:
    mov eax, [flag]     ; move flag into eax
    cmp eax, 0          ; check if flag is set
    jne END_PRINTNUM    ; if flag is set don't print
    mov eax, [number]   ; move number into eax
    push eax            ; push eax onto the stack
    push printnum       ; push printnum message onto the stack
    call printf         ; call printf
    pop ebx
    pop ebx
END_PRINTNUM:
    ret                 ; return

fizz:
    mov edx, 0          ; set edx to 0
    mov eax, [number]   ; move number into eax
    mov ebx, 3          ; move 3 into ebx
    div ebx             ; divide eax by ebx (3)
    cmp edx, 0          ; check if edx is 0 (no remainder)
    jnz END_FIZZ        ; if not 0 then end call
    inc byte [flag]     ; add 1 to flag - divisible by 3
    push printfizz      ; push printfizz message onto the stack
    call printf         ; call printf
    pop ebx             ; clear stack
END_FIZZ:
    ret                 ; return

buzz:
    mov edx, 0          ; set edx to 0
    mov eax, [number]   ; move number into eax
    mov ebx, 5          ; move 5 into ebx
    div ebx             ; divide eax by ebx (5)
    cmp edx, 0          ; check if edx is 0 (no remainder)
    jnz END_BUZZ        ; if not 0 then end call
    inc byte [flag]     ; add 1 to flag - divisible by 5
    push printbuzz      ; push printbuzz message onto the stack
    call printf         ; call printf
    pop ebx             ; clear stack
END_BUZZ:
    ret                 ; return

end:
    push endprint       ; end print
    call printf         ; call printf
    mov eax, 1          ; set system exit call
    int 0x80            ; call operating system
    ret



