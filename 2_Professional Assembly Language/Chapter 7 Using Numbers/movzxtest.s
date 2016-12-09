#template.s - An example of

.section .data

.section .bss

.section .text

.global main

main:

	movl $276, %ecx
	movzx %cl,%ebx
	movl $1,%eax
	int $0x80