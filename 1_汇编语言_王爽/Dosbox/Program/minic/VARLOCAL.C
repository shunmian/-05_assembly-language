int f(void);

main()
{
	int a = 1;
	a = f();
}

int f(void)
{
	int b = 2;
	int c = 3;
	int d;
	d = b+c;
	return d;
}