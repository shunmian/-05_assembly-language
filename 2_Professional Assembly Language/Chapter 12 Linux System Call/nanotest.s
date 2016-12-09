#nanotest.s - An example of print string

.section .data
	output:
		.asciz "This is a test\n"
	output_end:
		.equ len, output_end-output

	timestruct:
		.int 5, 0

.section .text
.global main

main:
	movl $10,%ecx
loop1:
	pushl %ecx
	movl $4,%eax
	movl $1,%ebx
	movl $output,%ecx
	movl $len,%edx
	int $0x80

	movl $162,%eax
	movl $timestruct,%ebx
	int $0x80

	popl %ecx
	loop loop1


	movl $1,%eax
	int $0x80
