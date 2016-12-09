#FPUStatustest.s - An example of

.section .data

.section .bss
	.lcomm status,2

.section .text

.global main

main:

	fstsw %ax
	fstsw status
	movl $1,%eax
	int $0x80