#FPUStacktest.s - An example of

.section .data
value1:
	.int 40
value2:
	.float 92.4405
value3:
	.double 221.440321

.section .bss
	.lcomm int1,4
	.lcomm control,2
	.lcomm status,2
	.lcomm result,4

.section .text

.global main

main:
	finit
	
	fstsw status
	fstcw control
	filds value1
	fists int1

	flds value2
	fldl value3

	fst %st(4)
	fxch %st(1)

	fstps result

	movl $1,%eax
	int $0x80