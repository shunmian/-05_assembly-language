#paramtest.s - An example of listing command line parameters

.section .data


.section .bss
	.lcomm radius,4
	.lcomm result,4

.section .text
.global _start

_start:
	

	
	fldcw precision
	movl $10,radius


	pushl #address 
	call pargs
	add $4,%esp
	movl %eax,result

	movl $1,%eax
	int $0x80

.type pargs,@function
pargs:

	pushl %ebp
	movl %esp,%ebp
	pushl %edi
	pushl %eax

	movl %ebp,%edi
	addl $8,%edi

loop1:
	movb (%edi),%al
	cmpb "0",%al
	jz end
	pushb %al
	call printf
	inc %edi
	jmp loop1
end:
	pushb '\n'
	call printf
	
	popl %eax
	popl %edi

	movl %ebp,%esp
	pop %ebp
	ret

