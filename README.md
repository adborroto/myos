### Check raw files

```
$od -t x1 -A n boot_sec.bin
```

### Compile the file

```
$ nasm boot_sect.asm -f bin -o boot_sect.bin
```

## Create ISO
truncate boot_sect.bin -s 1200K   
mkisofs -o $HOME/Downloads/unix/boot_sect.iso -b boot_sect.bin /$HOME/Downloads/unix

### Run with QEMU
qemu-system-x86_64 boot_sect.bin
