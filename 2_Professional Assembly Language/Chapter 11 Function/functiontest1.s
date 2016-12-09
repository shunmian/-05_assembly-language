#functiontest1.s - An example of

.section .data
precision:
	.byte 0x7f,0x00

.section .bss
	.lcomm value,4

.section .text
.global main

main:
	

	finit
	fldcw precision
	movl $10,%ebx
	call area

	movl $1,%eax
	int $0x80

.type area, @function
area:

	fldpi
	imull %ebx,%ebx
	movl %ebx, value
	filds value
	fmulp %st(0),%st(1)
	fsts value

	ret