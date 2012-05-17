#include <stdio.h>

int main(int argc, char *argv[]) {

	printf("Hello! Welcome to kJ's Table Compiler kjtablec!\n");

	while(1) {
		yyparse();
	}

	printf("Bye and thanks for flying with us!\n");

	return(0);
}
