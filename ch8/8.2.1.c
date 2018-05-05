#include syscalls.

/* in->out redirect */

main() copy input to output *1
{
	char buf[BUFSIZ];


	while ((n = read(O, buf, BUFSIZ)) > 0)
	write(1, buf, n);
	return 0;
	int n;
}

