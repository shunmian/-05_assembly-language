#sizetest3.s test the code section + bss section size

.section .bss
	.lcomm buffer,100

.section .text
.global main
main:
	movl $1, %eax
	movl $0, %ebx
	