#betterloop.s - An example of loop with ecx 0 checker

.section .data
output:
	.asciz "The value is %d\n"

.section .bss

.section .text

.global main

main:
	movl $0,%ecx
	movl $0,%eax
	jcxz done
loop1:
 	addl %ecx,%eax
 	loop loop1
done:
	pushl %eax
	pushl $output
	call printf
	movl $1,%eax
	int $0x80