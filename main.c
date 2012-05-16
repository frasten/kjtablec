#include <stdio.h>

int main(int argc, char *argv[]) {
		while(1){
		printf("%d %s\n", yylex(), yytext );
	}
	return(0);
}
