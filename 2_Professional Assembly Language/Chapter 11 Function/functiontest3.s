#functiontest3.s - An example of

.section .data
precision:
	.byte 0x7f,0x00

.section .bss
	.lcomm radius,4
	.lcomm result,4

.section .text
.global _start

_start:
	

	finit
	fldcw precision
	movl $10,radius

	pushl radius
	call area
	add $4,%esp
	movl %eax,result

	movl $1,%eax
	int $0x80

.type area, @function
area:
	pushl %ebp
	movl %esp,%ebp
	subl $4,%esp

	fldpi
	filds 8(%ebp)
	fmul %st(0),%st(0)
	fmulp %st(0),%st(1)
	fstps -4(%ebp)
	movl -4(%ebp),%eax

	movl %ebp,%esp
	popl %ebp

	ret