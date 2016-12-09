#movtest5.s an example of using cmova.

.section .data
	output:
		.asciz "The largest number is: %d\n"
	values:
		.int 101, 20, 301 ,400, 50, 60, 70, 800, 90, 100,110

.section .text

.global main

main:
		movl values,%eax
		movl $1, %edi
loop:	movl values(,%edi,4),%ebx
		cmp %ebx,%eax
		cmovb %ebx,%eax
		inc %edi
		cmp $11, %edi
		jne loop

		pushl %eax
		pushl $output
		call printf
		add $8,%esp

		movl $1,%eax
		movl $0,%ebx
		int $0x80