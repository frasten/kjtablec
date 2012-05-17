%{
	/* Prologue */
    #include <stdio.h>
    #include "table-def.h"
    extern Lexval lexval;
    char *newstring(char *s);
    int yylex(void);
    void yyerror(char *);
%}

/* Bison Declaration Section */
%token PROGRAM END SEMICOLON ID COMMA INTEGER STRING BOOLEAN TABLE LRB RRB EQUALS AND OR ASSIGN NEQUALS GT GET LT LET PLUS MINUS TIMES DIVIDE NOT JOIN LSB RSB PROJECT SELECT EXISTS ALL EXTEND UPDATE RENAME INTCONST STRCONST BOOLCONST LCB RCB IF THEN ELSE WHILE DO READ EPSILON WRITE ERROR

%%

/* BNF Grammar Rules Section */
program:	PROGRAM stat_list END { printf("%d\n", $2); }
			;

stat_list:	stat ';' stat_list { printf("%d\n", $2); }
			|stat
			;

stat:		TABLE ';'
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
