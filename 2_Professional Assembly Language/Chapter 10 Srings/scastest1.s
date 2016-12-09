#scastest1.s - An example of

.section .data
value1:
	.ascii "this is the test-of comparision"
value2:
	.ascii "-"
length:
	.int 31

.section .text
.global main

main:
	
	leal value1,%edi
	leal value2,%esi
	movl length,%ecx
	cld
	lodsb
	cld
	repne scasb
	je found
	movl $1,%eax
	movl $0,%ebx
	int $0x80
found:
	subl length,%ecx
	neg %ecx
	movl %ecx,%ebx
	movl $1,%eax
	int $0x80
