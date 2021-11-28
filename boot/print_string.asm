;
; Pring string using interrputs
;

[bits 16]
print_string:
    pusha
    mov ah, 0x0e
print_string_loop_begin:
    mov al, [bx]
    cmp al, 0
    je print_string_loop_end
    int 0x10
    add bx, 1
    jmp print_string_loop_begin
print_string_loop_end:
    popa
    ret