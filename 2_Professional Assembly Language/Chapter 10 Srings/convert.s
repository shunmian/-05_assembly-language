#convert.s - An example of

.section .data
value1:
	.asciz "This is 1 test of the conversion program!\n"
length:
	.int 43


.section .bss
	.lcomm output, 43

.section .text
.global main

main:
	leal value1,%esi
	leal value1,%edi
	movl length,%ecx
	cld
loop1:
	lodsb
	cmpb $'a',%al
	jb skip
	cmpb $'z',%al
	ja skip
	subb $0x20,%al
skip:
	stosb
	loop loop1

	movl $1,%eax
	int $0x80

