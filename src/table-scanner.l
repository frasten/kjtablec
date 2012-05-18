%{
/* code block */

//yacc generated header
#include "table-parser.h"

//global Table structures header
#include "table-def.h"

//Lexical variable
Lexval lexval;
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
>=			{return(GET);}
\<			{return('<');}
\<=			{return(LET);}
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
intconst	{lexval.ival=1; return(INTCONST);}
strconst	{lexval.ival=1; return(STRCONST);}
boolconst	{lexval.ival=1;return(BOOLCONST);}
{			{return('{');}
}			{return('}');}
if			{return(IF);}
then		{return(THEN);}
else		{return(ELSE);}
while		{return(WHILE);}
do			{return(DO);}
read		{return(READ);}
write		{return(WRITE);}
dummy		{return(DUMMY);}				/* ONLY FOR DEBUG! DELETE HERE AND IN PARSER */
id			{lexval.ival=1; return(ID);}
. 			{return(ERROR);}

%%

/* User Code Section */
