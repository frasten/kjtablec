%{
	/* code block */

	//yacc generated header
	#include "table-parser.h"

	//global Table structures header
	#include "table-def.h"

	//Lexical variable
	Lexval lexval;

	//user functions declarations
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
	/* returns the constant relative to the token and fills the lexval with appropriate attributes if needed */
{ws}		;
program		{return(PROGRAM);}
end			{return(END);}
;			{return(';');}
,			{return(',');}
integer		{return(INTEGER);}
string		{return(STRING);}
boolean		{return(BOOLEAN);}
table		{return(TABLE);}
\(			{return('(');}
\)			{return(')');}
=			{return('=');}
and			{return(AND);}
or			{return(OR);}
==			{return(EQUALS);}
!=			{return(NEQUALS);}
>			{return('>');}
>=			{return(GTE);}
\<			{return('<');}
\<=			{return(LTE);}
\+			{return('+');}
-			{return('-');}
\*			{return('*');}
\/			{return('/');}
not			{return(NOT);}
join		{return(JOIN);}
\[			{return('[');}
\]			{return(']');}
project		{return(PROJECT);}
select		{return(SELECT);}
exists		{return(EXISTS);}
all			{return(ALL);}
extend		{return(EXTEND);}
update		{return(UPDATE);}
rename		{return(RENAME);}
intconst	{lexval.ival = atoi(yytext); return(INTCONST);}
strconst	{lexval.sval = newstring(yytext); return(STRCONST);}
boolconst	{lexval.ival = (yytext[0] == 'f') ? 0 : 1; return(BOOLCONST);}
{			{return('{');}
}			{return('}');}
if			{return(IF);}
then		{return(THEN);}
else		{return(ELSE);}
while		{return(WHILE);}
do			{return(DO);}
read		{return(READ);}
write		{return(WRITE);}
id			{lexval.sval = newstring(yytext); return(ID);}
. 			{return(ERROR);}

%%

/* User Code Section */
char *newstring(char *s)
{
  char *p = malloc(strlen(s)+1);
  strcpy(p,s);
  return(p);
}
