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
	/* reutrns the constant relative to the token and fills the lexval with appropriate attributes if needed */
{ws}		;
program		{return(PROGRAM);}
table		{return(TABLE);}
end			{return(END);}
;			{return(';');}
. 			{return(ERROR);}

%%

/* User Code Section */
