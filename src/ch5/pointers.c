#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	int int_var = 11;
	 printf("Value of variable int_var is: %d", int_var);
	/* To print the address of a variable we use %p format specifier and ampersand (&) sign just
	 before the variable name like &num. */
   	printf("\nAddress of variable int_var is: %p", &int_var);
	
	int* stack_ptr;
	stack_ptr = &int_var;	
	printf("\nAddress of stack_ptr is: %p", &stack_ptr);
	printf("\nValue of stack_ptr is: %p", stack_ptr);
	printf("\nValue pointed to by stack_ptr is: %d", *stack_ptr);
	printf("\n");


	//int* p; // variable p is pointer to integer type
	int* heap_ptr = malloc(sizeof(int));	// return an address on the heap		
	*heap_ptr=22;
	printf("\nAddress of heap_ptr is: %p", &heap_ptr);
	printf("\nValue of heap_ptr is: %p", heap_ptr);
	printf("\nValue pointed to by heap_ptr is: %d", *heap_ptr);
	free(heap_ptr);
	printf("\nAddress of heap_ptr is: %p", &heap_ptr);
	printf("\nValue of heap_ptr is: %p", heap_ptr);
	printf("\nValue pointed to by heap_ptr is: %d", *heap_ptr);
	printf("\n");


	/*
	//void* shared = malloc(sizeof(int));
	//p = shared;
	*p = 19;
	printf("%zu\n",sizeof(*p));	// 4 bytes (i.e. the int)
	printf("%zu\n",sizeof(p));	// 8 bytes (the point mem addr.)
	printf("%p\n",&p);		// the variable mem addr (which contains the pointer)
	printf("%p\n",p);		// the pointer mem addr (which contains the value)	
	printf("%d\n",*p);		// the value pointed to by the pointer
	//free(shared);
	free(p);
	printf("%d\n",*p);		// the value pointed to by the pointer.

	*/
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
