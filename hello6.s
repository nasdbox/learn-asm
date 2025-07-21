	.global _start

	.section .data
primes:
	.word 2
	.word 3
	.word 5
	.word 7
	
	.section .text

numbers:
	.byte 1, 2, 3, 4, 5
	
_start:
	ldr r3, =primes
	ldr r0, [r3, #8]

_end:
	mov r7, #1
	@ mov r0, #0

	swi 0
