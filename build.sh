#!/bin/bash

set -e # exit on error
if [ $# -eq 0 ]; then
    echo "Usage: ./build.sh file1.s [file2.s ...]"
    exit 1
fi
USE_GLIBC=false
# Step 1: Assemble each .s into .o
obj_files=()
for src in "$@"; do
	if [[ "$src" == "-c" ]]; then
		USE_GLIBC=true
		continue
	fi
    if [[ "$src" != *.s ]]; then
        echo "Warning: '$src' is not an assembly (.s) file, skipping."
        continue
    fi
	
    obj="${src%.s}.o"
	if $USE_GLIBC; then
		arm-linux-gnueabi-as -o "$obj" "$src"
	else
		arm-none-eabi-as -o "$obj" "$src"
	fi
    obj_files+=("$obj")
done

# Step 2: Link all objects into hello.elf
if $USE_GLIBC; then
	arm-linux-gnueabi-gcc -static -o hello.elf "${obj_files[@]}"
else
	arm-none-eabi-ld -Ttext=0x10000 -o hello.elf "${obj_files[@]}"
fi

# Step 3: Run it
echo -e "[+] Running hello.elf with qemu-arm\n"
qemu-arm ./hello.elf

