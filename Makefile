all: kernel.bin boot_sect.bin
	cat build/boot_sect.bin build/kernel.bin > build/os.bin
# Build the kernel binary
kernel.bin : kernel_entry.o kernel.o
	ld -o build/kernel.bin -Ttext 0x1000 build/kernel_entry.o build/kernel.o --oformat binary

# Build the kernel
kernel.o : kernel/kernel.c
	gcc -ffreestanding -c kernel/kernel.c -o build/kernel.o

# Build the kernel entry object file .
kernel_entry.o : boot/kernel_entry.asm
	nasm boot/kernel_entry.asm -f elf64 -o build/kernel_entry.o

boot_sect.bin : boot/boot_sect.asm
	nasm boot/boot_sect.asm -f bin -o build/boot_sect.bin

clean:
	rm -f **/*.bin **/*.o *.o *.bin