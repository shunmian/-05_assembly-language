#pstringtest.s - An example of print string

.section .data
	output:
		.asciz "Hello world!"


.section .text
.global _start

_start:

	pushl $output
	call pstring
	add $4,%esp

	movl $1,%eax
	int $0x80

.type pstring,@function
pstring:

	pushl %ebp
	movl %esp,%ebp
	pushl %edi
	pushl %eax

	movl %ebp,%edi
	addl $8,%edi

loop1:
	movb (%edi),%al
	cmpb '0',%al
	jz end
	pushw %ax
	call printf
	inc %edi
	jmp loop1
end:
	pushw '\n'
	call printf
	
	popl %eax
	popl %edi

	movl %ebp,%esp
	pop %ebp
	ret