#include <stdio.h>

float convert(int deg){

	float result;
	result = (deg-32.0)/1.8;
	return result;
}

int main(){

	int i = 0;
	float result;
	for(i=0;i<230;i+=10){
		result = convert(i);
		printf("%d          %5.2f\n",i,result);
	}
	return 0;

}