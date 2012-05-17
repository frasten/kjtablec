%{
/* code block */
#include "table-def.h"
Lexval lexval;
char *newstring(char *s);
%}

/* Definitions Section */
%option noyywrap
blank		[ \t\n]
ws		 	{blank}+
letter		[A-Za-z]
digit		[0-9]
intconst	{digit}+
strconst	\"([^\"])*\”
boolconst	false|true
id			{letter}({letter}|{digit})*

%%

/* Rules Section */
{ws}		;
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

/* User Code Section */
char *newstring(char *s)
{
  char *p = malloc(strlen(s)+1);
  strcpy(p,s);
  return(p);
}
