#FPUMath1test.s - An example of

.section .data
value1:
	.float 43.65
value2:
	.int 22
value3:
	.float 76.34
value4:
	.float 3.1
value5:
	.float 12.43
value6:
	.int 6
value7:
	.float 140.2
value8:
	.float 94.21

output:
	.asciz "The output is: %f\n"


.section .bss
	.lcomm result,4

.section .text
.global main

main:
	finit
	
	flds value1
	fidiv value2
	flds value3
	fmuls value4
	fadd %st(1),%st(0)
	flds value5
	fidiv value6
	flds value7
	fdiv value8
	fsubr %st(1),%st(0)
	fdivr %st(2),%st(0)
	fstpl (%esp)
	pushl $output
	call printf

	movl $1,%eax
	int $0x80

