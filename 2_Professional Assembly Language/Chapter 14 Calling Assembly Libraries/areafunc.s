#areafunc.s - An example of

.section .text
.global areafunc
.type areafunc, @function
areafunc:
	pushl %ebp
	movl %esp,%ebp

	fldpi
	filds 8(%ebp)
	fmul %st(0),%st(0)
	fmul %st(1),%st(0)

	movl %ebp,%esp
	popl %ebp

	ret