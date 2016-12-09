#addtest3.s - An example of

.section .data

.section .bss

.section .text

.global main

main:

	movl $0, %ebx
	movl $0, %eax
	movb $190,%bl
	movb $100,%al
	addb %al,%bl
	jc over
	movl $1,%eax
	int $0x80
over:
	movl $0,%ebx
	movl $1,%eax
	int $0x80