.global _part2

.section .text

_part2:
    MOV R7, #1
    SWI 0

@ stack pointer, link register, program counter, current program status register (CPSR) -> N, Z, C, V, 
@ for twos complement we flip the bits and add 1 to it

