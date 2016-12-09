#addtest3.s - An example of

.section .data
data1:
	.int 315814
data2:
	.int 165432
result:
	.quad 0
output:
	.asciz "The result is %qd\n"

.section .bss

.section .text

.global main

main:

	movl data1, %eax
	movl data2, %ebx
	mul %ebx
	movl $result,%ecx
	movl %eax,(%ecx)
	movl %edx,4(%ecx)

	pushl %edx
	pushl %eax
	pushl $output
	call printf

	movl $1,%eax
	int $0x80