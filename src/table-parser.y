%{
    /* Prologue */
    #include <stdio.h>
    #include <string.h>

    //lex generated header
    #include "table-scanner.h"

    //global Table structures header
    #include "table-def.h"

    //Lexical variable: extern since it is declared in the scanner
    extern Lexval lexval;
    
    //function declarations
    void yyerror(char *);
%}

/* Bison Declaration Section */
%token PROGRAM END ID INTEGER STRING BOOLEAN TABLE AND OR EQUALS NEQUALS GTE LTE NOT JOIN PROJECT SELECT EXISTS ALL EXTEND UPDATE RENAME INTCONST STRCONST BOOLCONST IF THEN ELSE WHILE DO READ WRITE ERROR

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
            | '>'                           { printf("comp_op\n"); }
            | GTE                           { printf("comp_op\n"); }
            | '<'                           { printf("comp_op\n"); }
            | LTE                           { printf("comp_op\n"); }
            ;

comp_term   : comp_term low_bin_op low_term { printf("comp_term\n"); }
            | low_term                      { printf("comp_term\n"); }
            ;

low_bin_op  : '+'                           { printf("low_bin_op\n"); }
            | '-'                           { printf("low_bin_op\n"); }
            ;

low_term    : low_term high_bin_op factor   { printf("low_term\n"); }
            | factor                        { printf("low_term\n"); }
            ;

high_bin_op : '*'                           { printf("high_bin_op\n"); }
            | '/'                           { printf("high_bin_op\n"); }
            | join_op                       { printf("high_bin_op\n"); }
            ;

factor      : unary_op factor               { printf("factor\n"); }
            | '(' expr ')'                  { printf("factor\n"); }
            | ID                            { printf("factor\n"); }
            | constant                      { printf("factor\n"); }
            ;

unary_op    : '-'                           { printf("unary_op\n"); }
            | NOT                           { printf("unary_op\n"); }
            | project_op                    { printf("unary_op\n"); }
            | select_op                     { printf("unary_op\n"); }
            | exists_op                     { printf("unary_op\n"); }
            | all_op                        { printf("unary_op\n"); }
            | update_op                     { printf("unary_op\n"); }
            | extend_op                     { printf("unary_op\n"); }
            | rename_op                     { printf("unary_op\n"); }
            ;

join_op     : JOIN '[' expr ']'             { printf("join_op\n"); }
            ;

project_op  : PROJECT '[' id_list ']'       { printf("project_op\n"); }
            ;

select_op   : SELECT '[' expr ']'           { printf("select_op\n"); }
            ;

exists_op   : EXISTS '[' expr ']'           { printf("exists_op\n"); }
            ;

all_op      : ALL '[' expr ']'              { printf("all_op\n"); }
            ;

extend_op   : EXTEND '[' atomic_type ID '=' expr ']' { printf("extend_op\n"); }
            ;

update_op   : UPDATE '[' ID '=' expr ']'    { printf("update_op\n"); }
            ;

rename_op   : RENAME '[' id_list ']'        { printf("rename_op\n"); }
            ;

constant    : atomic_const                  { printf("constant\n"); }
            | table_const                   { printf("constant\n"); }
            ;

atomic_const: INTCONST                      { printf("atomic_const\n"); }
            | STRCONST                      { printf("atomic_const\n"); }
            | BOOLCONST                     { printf("atomic_const\n"); }
            ;

table_const : '{' table_instance '}'        { printf("table_const\n"); }
            ;

table_instance: tuple_list                  { printf("table_instance\n"); }
            | atomic_type_list              { printf("table_instance\n"); }
            ;

tuple_list  : tuple_const ',' tuple_list    { printf("tuple_list\n"); }
            | tuple_const                   { printf("tuple_list\n"); }
            ;

tuple_const : '(' atomic_const_list ')'     { printf("tuple_const\n"); }

atomic_const_list: atomic_const ',' atomic_const_list { printf("atomic_const_list\n"); }
            | atomic_const                  { printf("atomic_const_list\n"); }
            ;

atomic_type_list: atomic_type ',' atomic_type_list { printf("atomic_type_list\n"); }
            | atomic_type                  { printf("atomic_type_list\n"); }
            ;

if_stat     : IF expr THEN stat_list else_part END { printf("if_stat\n"); }
            ;

else_part   : ELSE stat_list                { printf("else_part\n"); }
            |                               { printf("else_part\n"); }
            ;

while_stat  : WHILE expr DO stat_list END   { printf("while_stat\n"); }
            ;

read_stat   : READ specifier ID             { printf("read_stat\n"); }
            ;

specifier   : '[' expr ']'                  { printf("specifier\n"); }
            |                               { printf("specifier\n"); }
            ;

write_stat  : WRITE specifier expr          { printf("write_stat\n"); }
            ;

%%

/* Epilogue: User Code Section */
void yyerror(char *s) {
    fprintf(stderr, "HOLY GUACAMOLE! We've got a %s at line number %d\n", s, yylineno);
}
