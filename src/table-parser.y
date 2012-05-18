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
%token PROGRAM END ID INTEGER STRING BOOLEAN TABLE AND OR EQUALS NEQUALS GTE LTE NOT JOIN PROJECT SELECT EXISTS ALL EXTEND UPDATE RENAME INTCONST STRCONST BOOLCONST IF THEN ELSE WHILE DO READ WRITE ERROR DUMMY

%%

/* BNF Grammar Rules Section */
program     : PROGRAM stat_list END     { printf("program\n"); }
            ;

stat_list   : stat ';' stat_list        { printf("stat_list\n"); }
            | stat                      { printf("Stat List 2\n"); }
            ;

stat        : def_stat                  { printf("stat\n"); }
            | assign_stat               { printf("stat\n"); }
            | if_stat                   { printf("stat!n"); }
            | while_stat                { printf("stat\n"); }
            | read_stat                 { printf("stat\n"); }
            | write_stat                { printf("stat\n"); }
            ;

def_stat    : type id_list              { printf("def_stat\n"); }
            ;

id_list     : ID ',' id_list                { printf("id_list\n"); }
            | ID                            { printf("id_list\n"); }
            ;

type        : atomic_type                   { printf("type\n"); }
            | table_type                    { printf("type\n"); }
            ;

atomic_type : INTEGER                       { printf("atomic_type\n"); }
            | STRING                        { printf("atomic_type\n"); }
            | BOOLEAN                       { printf("atomic_type\n"); }
            ;

table_type  : TABLE '(' attr_list ')'       { printf("table_type\n"); }
            ;

attr_list   : attr_decl ',' attr_list       { printf("attr_list\n"); }
            | attr_decl                     { printf("attr_list\n"); }
            ;

attr_decl   : atomic_type ID                { printf("attr_decl\n"); }
            ;

assign_stat : ID '=' expr                   { printf("assign_stat\n"); }
            ;

expr        : expr bool_op bool_term        { printf("expr\n"); }
            | bool_term                     { printf("expr\n"); }
            ;

bool_op     : AND                           { printf("bool_op\n"); }
            | OR                            { printf("bool_op\n"); }
            ;

bool_term   : comp_term comp_op comp_term   { printf("bool_term\n"); }
            | comp_term                     { printf("bool_term\n"); }
            ;

comp_op     : EQUALS                        { printf("comp_op\n"); }
            | NEQUALS                       { printf("comp_op\n"); }
            | GT                            { printf("comp_op\n"); }
            | GTE                           { printf("comp_op\n"); }
            | LT                            { printf("comp_op\n"); }
            | LTE                           { printf("comp_op\n"); }
            ;















dummy       : DUMMY { printf("dummy\n"); }
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
