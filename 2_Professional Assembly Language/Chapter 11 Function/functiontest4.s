#functiontest3.s - An example of

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

	pushl radius
	call area
	add $4,%esp
	movl %eax,result

	movl $1,%eax
	int $0x80

