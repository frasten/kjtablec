%{
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *);
%}
%token INTEGER
%%
program:
        program expr '\n'
{ printf("%d\n", $2); }
{ $$ = $1; }
{ $$ = $1 + $3; }
{ $$ = $1 - $3; }
| ;
expr:
%%
INTEGER
| expr '+' expr
| expr '-' expr
;
void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0; }
