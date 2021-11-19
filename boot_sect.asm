org 0x7c00

mov bp , 0x9000 ; Set the stask
mov sp , bp

mov bx, MSG_REAL_MODE
call print_string
call switch_to_pm
jmp boot_hang

%include "print_string.asm"
%include "gdt.asm"
%include "print_string_pm.asm"
%include "disk_load.asm"
%include "switch_to_pm.asm"

boot_drive:
	mov bx , 0x9000
	mov dh , 5
	mov dl , [ BOOT_DRIVE ]
	call disk_load

[bits 32]
boot_pm:
	mov ebx, MSG_PROTECT_MODE
	call print_string_pm

boot_hang:
	jmp $



; Gloval variables
BOOT_DRIVE: db 0
BOOTING_MSG: db "Booting OS...", 0
MSG_REAL_MODE: db "Starting real mode...", 0
MSG_PROTECT_MODE: db "Starting protect mode...", 0


; Bootsector padding
times 510-($-$$) db 0 
dw 0xaa55 
