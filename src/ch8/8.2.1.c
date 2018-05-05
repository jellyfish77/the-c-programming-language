#include "syscalls.h"

// my includes
#include "functions.h"

main()	/*copy input to output */
{
	char buf[BUFSIZ];
	int n;
	while ((n = read(O, buf, BUFSIZ)) > 0)
		write(1, buf, n);
	return 0;
}

