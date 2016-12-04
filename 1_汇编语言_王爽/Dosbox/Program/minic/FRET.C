int f(void);

int a,b,ab;

main()
{
	int c;
	a = 1;
	b = 2;
	c = f();
}
int f(void)
{
    int d;
    d = 1;
    ab = a+b;
	return ab;
}