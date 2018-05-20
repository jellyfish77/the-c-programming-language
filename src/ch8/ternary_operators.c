#include <unistd.h>
#include <stdio.h>

int main() {
	char buf[1];
	int x = 1;
	x == 3 ? x++ : x--;
	buf[0] = x+48;
	//buf[0] = '0';

	printf("%d\n", buf[0]);
	printf("%zu\n", sizeof(x));
	printf("%d\n", buf[0]);

	write(1, buf, 1);	
	buf[0] = 10; // New Line
	write(1, buf, 1);	


	return 0;
}
