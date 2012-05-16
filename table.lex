%{
	
#include "table-def.h"
Lexval lexval;
char *newstring(char *s);

%}
%option noyywrap

ws	[ \t\n]
spacing 	{ws}+
letter		 [A-Za-z]
digit		 [0-9]
intconst	{digit}+
strconst	\"([^\"])*\”
boolconst	false|true
id			{letter}({letter}|{digit})*

%%

{spacing}	;
int			{return(INT);}
string 		{return(STR);}
boolean	 	{return(BOOL);}
{intconst}	{lexval.ival = atoi(yytext); return(INTCONST);}
{strconst} 	{lexval.sval = newstring(yytext); return(STRCONST);}
{boolconst} {lexval.ival = (yytext[0] == 'f' ? 0 : 1); return(BOOLCONST);}
{id} 		{lexval.sval = newstring(yytext); return(ID);}
=			{return(ASSIGN);}
,			{return(COMMA);}
;			{return(SEMICOLON);}
. 			{return(ERROR);}

%%

char *newstring(char *s)
{
  char *p = malloc(strlen(s)+1);
  strcpy(p,s);
  return(p);
}

int main() {
	while(1){
		printf("%d %s\n", yylex(), yytext );
	}
	return(0);
}
