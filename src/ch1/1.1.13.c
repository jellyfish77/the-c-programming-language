#include <stdio.h>

// my includes
#include "../../include/functions.h"

int main() {

	int wordDigitCount[100] = { 0 };
	int currentWordDigitCount = 0;
	int currentWordNumber = 0;
	int wordLengthInstances[100] = { 0 };
	int maxWordLength = 0;
	int c;

	// read characters from input buffer (stdin)
	// ctrl+D inputs EOF
	while ((c = getchar()) !=EOF) {

 		//printf("Current character: '%c'\n", c);

		//increment current word if character found
		if (c != ' ' && c!= '\n') {
			//increment current word length
			currentWordDigitCount++;
			//printf("Incremented word #%d length to: %d \n", currentWordNumber, currentWordDigitCount);
		}

		//if end of word reached
		if ((c == ' ' || c == '\n') && currentWordDigitCount > 0) {
			//printf("End of word detected!\n");
			//printf("Saving size of word #%d: %d\n", currentWordNumber, currentWordDigitCount);
			//save current word count
			wordDigitCount[currentWordNumber] = currentWordDigitCount;
			//increment word instance count
			wordLengthInstances[currentWordDigitCount]++;
			if (maxWordLength < currentWordDigitCount)
				maxWordLength = currentWordDigitCount;
			//reset current word count
			currentWordDigitCount = 0;
			//increment current word number
			currentWordNumber++;
		}
	}

	printf("%s", "\nEOF received\n");
	printf("%s", "\nWord lengths at input position:\n");
	printArray(wordDigitCount, currentWordNumber);
//	printf("%s", "\nInstances of word lenths:\n");
//	printArray(wordLengthInstances, maxWordLength+1);
	printf("%s", "\nHistogram of word lengths:\n");
	printHistogram(wordLengthInstances, maxWordLength+1,'-');
	return 1;

}
