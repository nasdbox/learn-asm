
	
	.section .data
	.balign 4
question:	.asciz "What's your favorite number? "

	.balign 4
message:	.asciz "%d is a great number\n"

	.balign 4
pattern:	.asciz "%d"

	.balign 4
number:	.word 0

	.balign 4
lr_bu:	.word 0
	

	.global main
	.func main
	
	.section .text

main:
	@ store link register
	ldr r1, addr_lr_bu
	str lr, [r1]

	ldr r0, addr_question
	bl printf

	ldr r0, addr_pattern
	ldr r1, addr_number
	bl scanf

	ldr r0, addr_message
	ldr r1, addr_number
	ldr r1, [r1]
	bl printf
	
	@ restore link register
	ldr lr, addr_lr_bu
	ldr lr, [lr]

	@ return from main
	bx lr


	@ define addresses
addr_question:	.word question
addr_message:	.word message
addr_pattern:	.word pattern
addr_number:	.word number
addr_lr_bu:	.word lr_bu

	.global printf
	.global scanf
