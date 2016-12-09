#cmpstest2.s - An example of

.section .data
value1:
	.ascii "this is the test of comparision"
value2:
	.ascii "this is The test of comparision"

.section .text
.global main

main:
	
	movl $1,%eax
	leal value1,%esi
	leal value2,%edi
	movl $31,%ecx
	cld
	repe cmpsb
	je equal
	movl $0,%ebx
	int $0x80
equal:
	movl $1,%ebx
	int $0x80
