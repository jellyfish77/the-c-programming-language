#include <unistd.h>
#include <stdio.h>
//#include "syscalls.h" /* deprecated?/*

// my includes
#include "../../include/functions.h"

/* getchar: unbuffered single character input */
int getchar(void) 
{
	char c;
	return (read(0, &c, 1) == 1) ? (unsigned char) c : EOF;
}

