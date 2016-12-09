#include <stdio.h>

int greaterfunc(int, int);

int main()
{
	int a = 10;
	int b = 20;

	printf("the larger value between %d and %d is: %d\n",a,b,greaterfunc(a,b));

}