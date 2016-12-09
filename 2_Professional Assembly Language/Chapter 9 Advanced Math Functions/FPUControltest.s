#FPUControltest.s - An example of

.section .data

newvalue1:
	.byte 0x71,0x00

.section .bss
	.lcomm control,2

.section .text

.global main

main:

	fstcw control
	fldcw newvalue1
	fstcw control
	movl $1,%eax
	int $0x80