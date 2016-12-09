#swaptest.s -An example of using the BSWAP instruction

.section .data

.section .bss

.section .text

.global main

main:

	movl $0x12345678,%eax
	bswap %eax
	movl $1,%eax
	movl $0,%ebx
	int $0x80