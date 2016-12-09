#cmpstest1.s - An example of

.section .data
value1:
	.ascii "Test"
value2:
	.ascii "Test"

.section .text
.global main

main:
	
	movl $1,%eax
	leal value1,%esi
	leal value2,%edi
	cld
	cmpsl
	je equal
	movl $0,%ebx
	int $0x80
equal:
	movl $1,%ebx
	int $0x80
