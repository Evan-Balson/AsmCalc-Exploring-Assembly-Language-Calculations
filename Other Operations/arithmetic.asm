global main
extern printf

SECTION .data
    printnum db "%d",0xa,0x0
    printfizz db "fizz",0xa,0x0
    printbuzz db "buzz",0xa,0x0
    printfizzbuzz db "fizzbuzz",0xa,0x0
    number dd 15

SECTION .text

main:
    mov edx, 0          ; set edx to 0
    mov eax, [number]   ; place number in eax
    mov ebx, 3          ; mov 3 into ebx
    div ebx             ; divide eax by ebx (3)
    cmp edx, 0          ; check if edx is 0 (no remainder)
    jz FIZZ             ; if 0 jump to FIZZ
    mov edx, 0          ; set edx to 0
    mov eax, [number]   ; place number in eax
    mov ebx, 5          ; mov 5 into ebx
    div ebx             ; divide eax by ebx (5)
    cmp edx, 0          ; check if edx is 0 (no remainder)
    jz BUZZ             ; if 0 jump to buzz
PRINTNUM:               ; number is not divisible by either
    mov eax, [number]   ; place number in eax
    push eax            ; push eax onto the stack
    push printnum       ; push printnum message onto the stack
    call printf         ; call printf
    jmp END             ; jump to end
FIZZ:                   ; number divisible by 3
    mov edx, 0          ; set edx to 0
    mov eax, [number]   ; place number in eax
    mov ebx, 5          ; mov 5 into ebx
    div ebx             ; divide eax by ebx (5)
    cmp edx, 0          ; check if edx is 0 (no remainder)
    jz FIZZBUZZ         ; if 0 jump to FIZZBUZZ
    push printfizz      ; push printfizz message onto the stack
    call printf         ; call printf
    jmp END             ; jump to end
BUZZ:                   ; number is only divisible by 5
    push printbuzz      ; push printbuzz message onto the stack
    call printf         ; call printf
    jmp END             ; jump to end
FIZZBUZZ:               ; number divisible by 3 and 5
    push printfizzbuzz  ; push printfizzbuzz message onto the stack
    call printf         ; call printf
    jmp END             ; jump to end
END:
    mov eax, 1          ; set system exit call
    int 0x80            ; call operating system
