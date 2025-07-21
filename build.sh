#!/bin/bash

set -e # exit on error
if [ $# -eq 0 ]; then
    echo "Usage: ./build.sh file1.s [file2.s ...]"
    exit 1
fi

# Step 1: Assemble each .s into .o
obj_files=()
for src in "$@"; do
    if [[ "$src" != *.s ]]; then
        echo "Warning: '$src' is not an assembly (.s) file, skipping."
        continue
    fi

    obj="${src%.s}.o"
    arm-none-eabi-as -o "$obj" "$src"
    obj_files+=("$obj")
done

# Step 2: Link all objects into hello.elf
arm-none-eabi-ld -Ttext=0x10000 -o hello.elf "${obj_files[@]}"

# Step 3: Run it
echo "[+] Running hello.elf with qemu-arm"
qemu-arm ./hello.elf

