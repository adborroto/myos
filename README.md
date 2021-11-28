### Check for dump files

```
$ od -t x1 -A n boot_sect.bin
```

### Compile the file

```
$ nasm boot_sect.asm -f bin -o boot_sect.bin
```

## Create ISO
truncate boot_sect.bin -s 1200K   
mkisofs -o /boot_sect.iso -b boot_sect.bin /

### Run with QEMU
qemu-system-x86_64 boot_sect.bin

## Compile & dump
```c
gcc -ffreestanding -c examples/my_function.c -o examples/my_function.o 
objdump -d examples/my_function.o

```

To output raw machine code into a file basic.bin, we can use the following command

```
ld -o basic.bin -Ttext 0x0 --oformat binary basic.o
```

To
see what machine code the compiler actually generated from our C source code, run the
following command:

```
ndisasm -b 32 basic.bin > basic.dis
```

## Compile kernel

Compile this to raw binary as follows:

```
$ gcc -ffreestanding -c kernel.c -o kernel.o
$ ld -o kernel.bin -Ttext 0x1000 kernel.o --oformat binary
```