#syscallrettest.s - An example of print string

.section .bss
	.lcomm pid,4
	.lcomm uid,4
	.lcomm gid,4

.section .text
.global main

main:

	movl $20,%eax
	int $0x80
	movl %eax,pid

	movl $24,%eax
	int $0x80
	movl %eax,uid

	movl $47,%eax
	int $0x80
	movl %eax,gid

	movl $1,%eax
	int $0x80
