#sizetest2.s test the code section + data section size

.section .data
	buffer:
		.fill 10000

.section .text
.global main
main:
	movl $1, %eax
	movl $0, %ebx
	