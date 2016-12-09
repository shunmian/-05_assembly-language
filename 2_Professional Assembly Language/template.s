#template.s - An example of

.section .data

.section .bss

.section .text

.global main

main:



	movl $1,%eax
	movl $0,%ebx
	int $0x80