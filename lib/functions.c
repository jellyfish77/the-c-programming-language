#include <stdio.h>

void printArray(int *pointerToArray, int arrLength) {

	printf("Array length: %d\n", arrLength);
	int n;
	n = sizeof(pointerToArray)/sizeof(pointerToArray[0]);
	printf("Size of first array element: %lu\n", sizeof(pointerToArray[0]));
	printf("Size of array: %lu\n", sizeof(pointerToArray));
	printf("Array length (calculated): %d\n", n);
	for(int i = 0; i < arrLength; i++) {
		printf("[%d] %d\n", i, pointerToArray[i]);
	}
}

void printHistogram(int *pointerToArray, int arrLength, int character) {

	for(int i = 0; i < arrLength; i++) {
		if(pointerToArray[i] != 0) {
			printf("[%d] ", i);
			for(int j = 0; j < pointerToArray[i]; j++) {
				printf("%c", character);
			}
			printf("\n");
		}
	}
}
