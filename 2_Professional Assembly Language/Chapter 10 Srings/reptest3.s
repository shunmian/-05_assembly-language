#reptest3.s - An example of

.section .data
value1:
	.asciz "This is a test of the conversion program!\n"
length:
	.int 43


.section .bss
	.lcomm output, 43

.section .text
.global main

main:
	leal value1,%esi
	leal output,%edi
	movl length,%ecx
	shrl $2,%ecx
	rep movsl

	mov length,%ecx
	andl $3,%ecx
	rep movsb

	movl $1,%eax
	int $0x80

