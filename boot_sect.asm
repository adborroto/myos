org 0x7c00

mov bp , 0x8000 ; define stask
mov sp , bp

start:
	mov bx, BOOTING_MSG
	call print_string

	mov bx , 0x9000

	mov dh , 5
	mov dl , [ BOOT_DRIVE ]
	call disk_load

	jmp $


%include "print_string.asm"
%include "disk_load.asm"

vars:
	BOOT_DRIVE: db 0
	BOOTING_MSG: db "Booting OS...", 0

end:
	times 510-($-$$) db 0   ;填充程序到512个字节
	dw 0xaa55 
