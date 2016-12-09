#scastest1.s - An example of

.section .data
value1:
	.asciz "this is the test-of comparision"
value2:
	.ascii "0"

.section .text
.global main

main:
	
	leal value1,%edi
	leal value2,%esi
	movl $0xffffffff,%ecx
	cld
	lodsb
	repne scasb
	subl $0xffffffff,%ecx
	neg %ecx
	movl %ecx,%ebx
	subl $2,%ebx
	movl $1,%eax
	int $0x80
