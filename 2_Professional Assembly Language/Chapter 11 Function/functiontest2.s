#functiontest2.s - An example of

.section .data
precision:
	.byte 0x7f,0x00

.section .bss
	.lcomm radius,4
	.lcomm result,4

.section .text
.global main

main:
	

	finit
	fldcw precision
	movl $10,radius
	call area

	movl $1,%eax
	int $0x80

.type area, @function
area:

	fldpi
	filds radius
	fmul %st(0),%st(0)
	fmulp %st(0),%st(1)
	fsts result

	ret