; Load DH sectors to ES : BX from drive DL
[bits 16]
disk_load :
    mov bx , DISK_LOAD_MSG
    call print_string
    push dx
    mov ah , 0x02
    mov al , dh
    mov ch , 0x00
    
    mov dh , 0x00
    mov cl , 0x02
    int 0x13
    
    jc disk_error 
    pop dx
    cmp dh , al
    jne disk_error
   
    ret 

disk_error :
    mov bx , DISK_ERROR_MSG
    call print_string
    call boot_hang

DISK_ERROR_MSG db "Disk read error ! " , 0
DISK_LOAD_MSG db "Loading disk... " , 0