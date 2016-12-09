#bubble.s - An example of bubble sort

.section .data
	values:
		.int 105,235,61,315,134,221,53,145,117,5

.section .bss

.section .text

.global main

main:
	movl $values,%edi
	movl $0,%eax
outloop:
	
	movl %eax,%ebx
innerloop:
	inc %ebx
	movl (%edi),%esi
	cmp %esi,4(%edi)
	ja skip
	xchg %esi,4(%edi)
	xchg %esi,(%edi)	
skip:
	cmp $9,%ebx
	jnz innerloop
	inc %eax
	cmp $8,%eax
	jnz outloop


	movl $1,%eax
	movl $0,%ebx
	int $0x80