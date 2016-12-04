#include <stdio.h>

int main(int argc, char *argv[]){

	while(1){
		int x = 0;
		int y = 1;
		int z = 0;
		do{
			printf("%d\n",x);
			z = x + y;
			x = y;
			y = z;
		}while(x < 255);
	}
}