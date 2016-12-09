#areafunc.s - An example of

.section .text
.global greaterfunc
.type greaterfunc, @function
greaterfunc:
	pushl %ebp
	movl %esp,%ebp

	movl 8(%ebp),%eax
	movl 12(%ebp),%ebx
	cmpl %ebx,%eax
	ja end
	xchg %ebx,%eax
end:
	movl %ebp,%esp
	popl %ebp

	ret