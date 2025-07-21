	.global _start

	.section .text

_start:
	mov r1, #2
	mov r2, #3
	
	@loading 
	str r1, [sp, #-4]!
	str r2, [sp, #-4]!

	@ unloading
	ldr r0, [sp], #4
	ldr r0, [sp], #4


_end:
	mov r7, #1

	swi 0
