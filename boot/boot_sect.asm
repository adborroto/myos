org 0x7c00
KERNEL_OFFSET equ 0x1000 ; This is the memory offset to which we will load our kernel

mov bp , 0x9000 ; Set the stask
mov sp , bp

mov bx, MSG_REAL_MODE
call print_string

call load_kernel
call switch_to_pm
jmp boot_hang

%include "boot/print_string.asm"
%include "boot/gdt.asm"
%include "boot/print_string_pm.asm"
%include "boot/disk_load.asm"
%include "boot/switch_to_pm.asm"

[bits 16]
load_kernel:
	mov bx, MSG_LOADING_KERNEL
	call print_string

	mov bx , KERNEL_OFFSET
	mov dh , 15
	mov dl , [ BOOT_DRIVE ]
	call disk_load


	ret

[bits 32]
boot_pm:
	mov ebx, MSG_PROTECT_MODE
	call print_string_pm
	call KERNEL_OFFSET ; Give control to the kernel
	jmp boot_hang
	

boot_hang:
	jmp $



; Gloval variables
BOOT_DRIVE: db 0
BOOTING_MSG: db "Booting OS...", 0
MSG_REAL_MODE: db "Starting real mode...", 0
MSG_PROTECT_MODE: db "Starting protect mode...", 0
MSG_LOADING_KERNEL: db "Loading kernel...", 0


; Bootsector padding
times 510-($-$$) db 0 
dw 0xaa55 
