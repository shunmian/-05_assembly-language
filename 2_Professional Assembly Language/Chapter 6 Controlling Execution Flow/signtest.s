#signtest.s - An example of test sign flag

.section .data
output:
	.asciz "The value is %d\n"

values:
	.int 10,20,30,40,50,60,70,80,90,100

.section .bss

.section .text

.global main

main:
	movl $9,%ebx

loop:
	pushl values(,%ebx,4)
	pushl $output
	call printf
	add $8,%esp
	dec %ebx
	jns loop 
	movl $1,%eax
	int $0x80