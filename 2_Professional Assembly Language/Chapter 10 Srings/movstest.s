#movstest.s - An example of

.section .data
value1:
	.ascii "This is a test string.\n"
.section .bss
	.lcomm output, 23

.section .text
.global main

main:
	leal value1,%esi
	leal output,%edi

	movsb
	movsw
	movsl

	movl $1,%eax
	int $0x80

