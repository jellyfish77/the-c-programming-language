#include <unistd.h>
//#include "syscalls.h" /* deprecated?/*

// my includes
#include "../../include/functions.h"

main()	/*copy input to output */
{
	char buf[BUFSIZ];
	int n;
	while ((n = read(0, buf, BUFSIZ)) > 0)
		write(1, buf, n);
	return 0;
}

