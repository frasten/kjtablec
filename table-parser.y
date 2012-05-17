%{
	/* Prologue */
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *);
%}

/* Bison Declaration Section */
%token INTEGER

%%

/* Grammar Rules Section */
program:
        program expr '\n'
{ printf("%d\n", $2); }
{ $$ = $1; }
{ $$ = $1 + $3; }
{ $$ = $1 - $3; }
| ;
expr:

%%

/* Epilogue: User Code Section */
INTEGER
| expr '+' expr
| expr '-' expr
;
void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}
