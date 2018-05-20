#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	int* p; // variable p is pointer to integer type
	void* shared = malloc(sizeof(int));
	p = shared;
	*p = 19;
	printf("%zu\n",sizeof(*p));	// 4 bytes (i.e. the int)
	printf("%zu\n",sizeof(p));	// 8 bytes (the point mem addr.)
	printf("%p\n",p);		// the pointer mem addr.
	printf("%p\n",&p);		// the variable mem addr.
	printf("%d\n",*p);		// the value pointed to by the pointer.
	free(shared);
	printf("%d\n",*p);		// the value pointed to by the pointer.

	/*	
	int i2; // integer value

	//You turn a pointer into a value with *:
	int i3 = *p; // integer i2 is assigned with integer value that pointer p is pointing to

	//You turn a value into a pointer with &:
	int* p2 = &i; // pointer p2 will point to the address of integer i
	//Edit: In the case of arrays, they are treated very much like pointers. If you think of 
	//them as pointers, you'll be using * to get at the values inside of them as explained above, 
	//but there is also another, more common way using the [] operator:

	int a[2];  // array of integers
	int i4 = *a; // the value of the first element of a
	int i5 = a[0]; // another way to get the first element

	//To get the second element:
	int a2[2]; // array
	int i6 = *(a + 1); // the value of the second element
	int i7 = a[1]; // the value of the second element

	//So the [] indexing operator is a special form of the * operator, and it works like this:
	a[i] == *(a + i);  // these two statements are the same thing
	*/
}
