[ bits 32] ; We ’re in protected mode by now , so use 32 - bit instructions.
[ extern _start ] 
call _start
jmp $