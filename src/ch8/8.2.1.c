#include <unistd.h>
#include <stdio.h>
//#include "syscalls.h" /* deprecated?/*

// my includes
#include "../../include/functions.h"


// System calls, e.g. write(), are implemented by the operating system, and run in kernel mode. 
// Library functions .e.g printf(), are implemented in user mode, just like application code. 
int main()	/*copy input to output */
{
	char buf[BUFSIZ];
	int n;
	while ((n = read(0, buf, BUFSIZ)) > 0)
		// params:
		//	The destination, e.g. 1 for starndard output
		//	A pointer to a buffer of at least nbytes bytes, which will be written to destination.
		//	The number of bytes to write. If smaller than the provided buffer, the output is truncated.
		// Returns the number of bytes that were written. If value is negative, then the system call returned an error.
		write(1, buf, n);
	return 0;
}

