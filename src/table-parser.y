%{
	/* Prologue */
    #include <stdio.h>
    #include <string.h>

    //global Table structures header
    #include "table-def.h"

    //Lexical variable: extern since it is declared in the scanner
    extern Lexval lexval;
    
    //function declarations
    int yylex(void);
    void yyerror(char *);
    char *newstring(char *s);
%}

/* Bison Declaration Section */
%token PROGRAM END ID INTEGER STRING BOOLEAN TABLE AND OR EQUALS NEQUALS GET LET NOT JOIN PROJECT SELECT EXISTS ALL EXTEND UPDATE RENAME INTCONST STRCONST BOOLCONST IF THEN ELSE WHILE DO READ WRITE ERROR

%%

/* BNF Grammar Rules Section */
program     : PROGRAM stat_list END { printf("Program!\n"); }
		      	;

stat_list   :	stat ';' stat_list { printf("Stat List 1\n"); }
		      	| stat { printf("Stat List 2\n"); }
			      ;

stat        :	TABLE { printf("Statement!\n"); }
			      ;

specifier   : '[' stat ']'
            |
            ;

%%

/* Epilogue: User Code Section */
void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

char *newstring(char *s)
{
  char *p = malloc(strlen(s)+1);
  strcpy(p,s);
  return(p);
}
