#include <stdio.h>

char *cpuidfunc(void);

int main()
{
	char *output = cpuidfunc();

	printf("the CPUID: %s\n",output);

}