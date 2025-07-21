	@ comment
	/* Multi line
	Comment
	*/
	
	.global _start
	
	.section .text 


_start:
	mov r7, #3
	mov r0, #0
	ldr r1, =character
	mov r2, #1

	swi 0

_uppercase:
	ldr r1, =character
	ldr r0, [r1]
	bic r0, r0, #32
	str r0, [r1]
	
	swi 0

_write:
	mov r7, #4
	mov r0, #1
	ldr r1, =character
	mov r2, #1

	swi 0
	
exit:
	mov r7, #0x01
	mov r0, #0

	swi 0

	.section .data
character:
	.ascii " "

