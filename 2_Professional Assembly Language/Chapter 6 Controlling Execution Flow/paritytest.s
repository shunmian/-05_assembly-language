#paritytest.s - An example of test parity flag

.section .data

.section .bss

.section .text

.global main

main:
	movl $1,%eax
	movl $3,%ebx
	subl $4,%ebx
	jp end
	movl $100,%ebx
	int $0x80
end:
	int $0x80