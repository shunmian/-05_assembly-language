#FPUMath1test.s - An example of

.section .data
value1:
	.float 43.65
value2:
	.float -22.0
value3:
	.float 64.00


.section .text
.global main

main:
	finit
	
	flds value1
	fchs
	flds value2
	fabs
	flds value3
	fsqrt

	movl $1,%eax
	int $0x80

