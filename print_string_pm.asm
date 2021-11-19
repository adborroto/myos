;
; Pring string in protect mode
;

[bits 32]

VIDEO_MEMORY: equ 0xb8000
BLACK_ON_WHITE: equ 0xf0

print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY
print_string_pm_loop_begin:
    mov al, [ebx]
    mov ah, BLACK_ON_WHITE

    cmp al, 0
    je print_string_pm_loop_end
    mov [edx], ax
    add ebx, 1
    add edx, 2
    jmp print_string_pm_loop_begin
print_string_pm_loop_end:
    popa
    ret