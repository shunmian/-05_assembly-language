#cfunctest.s - An example of c function call

.section .data
	output:
		.asciz "This is a test\n"
	output_end:
		.equ len, output_end-output

.section .text
.global main

main:
	movl $10,%ecx
loop1:
	pushl %ecx
	
	pushl $output
	call printf
	addl $4,%esp

	pushl $5
	call sleep
	addl $4,%esp

	popl %ecx
	loop loop1


	pushl $0
	call exit
