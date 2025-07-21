	@ comment
	/* Multi line
	Comment
	*/
	
	.global _start
	
	.section .text 


_start:
	mov r0, #0
	b _continue_loop

_loop:
	add r0, r0, #1

_continue_loop:
	cmp r0, #9
	ble _loop

end:
	mov r7, #1

	swi 0
