#!/bin/bash

echo "Building..."
nasm boot_sect.asm -f bin -o boot_sect.bin

echo "Running..."
qemu-system-x86_64 boot_sect.bin
