#functiontest3.s - An example of

.section .data
output:
	.ascii "This is from assembly function\n"

.section .text
.global asmfunc
.type asmfunc, @function
asmfunc:
	pushl %ebp
	movl %esp,%ebp
	
	pusha

	movl $4,%eax
	movl $1,%ebx
	movl $output,%ecx
	movl $31,%edx
	int $0x80
	popa

	movl %ebp,%esp
	popl %ebp

	ret