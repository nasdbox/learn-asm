MOV R7, #1 @ we want to quit the program
<instruction> <Dest>, <Operand>, <Operand>

ORR AND EOR
bic - bit clear

in bic there should be top bit and bottom bit to be 1 and 0 respectively to be 1 otherwise 0

in bic if we want to clear bit at 5th position then use 32 to clear that bit out

STDIN, STDOUT, STDERR

tst performs and with set flag (doesn't modify the reg)

echo $? --> r0

subgt subtracts only when gt condition is true

mov r0, r1, lsl #1 (logical shift left)

a word is 4 bytes in 32 bit arm chip

===============================================
                GDB stuff
===============================================
list
disassemble _start
b 14
delete 14
run
info r
continue
quit
x/4w _start --> examine 4 word worth of data in _start

str r4, [r3] --> *r3 = r4
ldr r0, [r3] --> r0 = *r3

