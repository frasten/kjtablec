#include <stdio.h>
// scanner header file needed only if accessing scanner's environment from main.c
// #include "table-scanner.h"

int main(int argc, char *argv[]) {
	printf("Hello! Welcome to kJ's Table Compiler kjtablec!\n");

	while(1) {
		// printf("%d %s\n", yylex(), yytext );
		yyparse();
	}

	printf("Bye and thanks for flying with us!\n");
	return(0);
}
