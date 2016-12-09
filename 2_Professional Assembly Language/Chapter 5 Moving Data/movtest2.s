#movtest2.s move data from memory to register

.section .data
	value:
		.int 1
.section .text
.global main
main:
	movl $1, %eax
	movl value,%eax
	movl $100,%eax
	movl %eax,value
	int $0x88
	