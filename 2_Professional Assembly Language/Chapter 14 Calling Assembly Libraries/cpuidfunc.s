#square.s - An example of

.section .bss
	.lcomm output,13

.section .text
.global cpuidfunc
.type cpuidfunc, @function
cpuidfunc:
	pushl %ebp
	movl %esp,%ebp

	movl $0, %eax
	cpuid
	movl $output,%edi
	movl %ebx,(%edi)
	movl %edx,4(%edi)
	movl %ecx,8(%edi)

	movl %edi, %eax

	movl %ebp,%esp
	popl %ebp

	ret