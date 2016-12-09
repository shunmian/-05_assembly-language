#pstringtest.s - An example of print string

.section .data
	output:
		.ascii "Hello world!\n"
	output_end:
		.equ len, output_end-output

.section .text
.global main

main:

	movl $4,%eax
	movl $1,%ebx
	movl $output, %ecx
	movl $len,%edx
	int $0x80

	movl $1,%eax
	int $0x80
