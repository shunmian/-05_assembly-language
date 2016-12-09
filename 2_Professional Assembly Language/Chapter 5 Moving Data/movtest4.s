#movtest4.s an example of using indexed memory locations.

.section .data
	values:
		.int 10, 20, 30 ,40, 50, 60, 70, 80, 90, 100,110

.section .text

.global main

main:

	movl values,%eax
	movl $values,%eax
	movl $100,4(%eax)
	movl $1,%edi
	movl values(,%edi,4),%ebx	

	movl $1,%eax
	int $0x80