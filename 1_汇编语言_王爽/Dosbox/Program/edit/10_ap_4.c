void add(int, int, int);

main()
{
	int a = 1;
	int b = 2;
	int c = 0;
	add(a,b,c);
	c++;
}

void add(int a, int b, int c)
{
	c = a + b;
}