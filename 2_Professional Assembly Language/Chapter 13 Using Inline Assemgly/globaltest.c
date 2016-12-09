#include <stdio.h>

int a = 10;
int b = 3;
int result = 0;

int main()
{
	asm("pusha\n\t"
		"movl a, %eax\n\t"
		"movl b, %ebx\n\t"
		"imull %ebx, %eax\n\t"
		"movl %eax,result\n\t"
		"popa\n\t"
	);

	printf("the result is %d\n",result);

}